package com.example.rxjavamap.NetWorking;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

import okhttp3.Connection;
import okhttp3.Headers;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okhttp3.internal.http.HttpHeaders;
import okio.Buffer;


public class HttpLoggingInterceptor implements Interceptor {

    private static final Charset UTF8 = Charset.forName("UTF-8");

    private volatile Level level = Level.NONE;
    private Logger logger;
    private String tag;
    private boolean isLogEnable = false;

    public enum Level {
        NONE,       //不打印log
        BASIC,      //只打印 请求首行 和 响应首行
        HEADERS,    //打印请求和响应的所有 Header
        BODY        //所有数据全部打印
    }

    public void log(String message) {
        if (HttpLog.customLogger != null) {
            HttpLog.i(message);
        } else {
            logger.log(java.util.logging.Level.INFO, message);
        }
    }

    public HttpLoggingInterceptor(String tag) {
        this.tag = tag;
        logger = Logger.getLogger(tag);
    }

    public HttpLoggingInterceptor(String tag, boolean isLogEnable) {
        this.tag = tag;
        this.isLogEnable = isLogEnable;
        logger = Logger.getLogger(tag);
    }

    public HttpLoggingInterceptor setLevel(Level level) {
        if (level == null) throw new NullPointerException("level == null. Use Level.NONE instead.");
        this.level = level;
        return this;
    }

    public Level getLevel() {
        return level;
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        if (level == Level.NONE) {
            return chain.proceed(request);
        }

        //请求日志拦截
        logForRequest(request, chain.connection());

        //执行请求，计算请求时间
        long startNs = System.nanoTime();
        Response response;
        try {
            response = chain.proceed(request);
        } catch (Exception e) {
            log("<-- HTTP FAILED: " + e);
            throw e;
        }
        long tookMs = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - startNs);

        //Logc.e(tag, "+++++++++++++++++++++++++++end+++++++++++耗时:" + tookMs + "毫秒");

        //响应日志拦截
        return logForResponse(response, tookMs);
    }

    private void logForRequest(Request request, Connection connection) throws IOException {
        StringBuilder logBuilder = new StringBuilder();
        logBuilder.append("-------------------------------request-------------------------------").append("\n");
        boolean logBody = (level == Level.BODY);
        boolean logHeaders = (level == Level.BODY || level == Level.HEADERS);
        RequestBody requestBody = request.body();
        boolean hasRequestBody = requestBody != null;
        Protocol protocol = connection != null ? connection.protocol() : Protocol.HTTP_1_1;

        try {
            String requestStartMessage = "--> " + request.method() + ' ' + URLDecoder.decode(request.url().url().toString(),UTF8.name()) + ' ' + protocol;
            logBuilder.append(requestStartMessage).append("\n");

            if (logHeaders) {
                Headers headers = request.headers();
                for (int i = 0, count = headers.size(); i < count; i++) {
                    logBuilder.append("\t" + headers.name(i) + ": " + headers.value(i)).append("\n");
                }

                //log(" ");
                if (logBody && hasRequestBody) {
                    if (isPlaintext(requestBody.contentType())) {
                        bodyToString(request);
                    } else {
                        logBuilder.append("\tbody: maybe [file part] , too large too print , ignored!").append("\n");
                    }
                }
            }
        } catch (Exception e) {
            e(e);
        } finally {
            logBuilder.append("--> END " + request.method());
            log(logBuilder.toString());
        }
    }

    private Response logForResponse(Response response, long tookMs) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("-------------------------------response-------------------------------");
        Response.Builder builder = response.newBuilder();
        Response clone = builder.build();
        ResponseBody responseBody = clone.body();
        boolean logBody = (level == Level.BODY);
        boolean logHeaders = (level == Level.BODY || level == Level.HEADERS);

        try {
            stringBuilder.append("<-- " + clone.code() + ' ' + clone.message() + ' ' + URLDecoder.decode(clone.request().url().url().toString(),
                    UTF8.name()) + " (" + tookMs + "ms）").append("\n");
            if (logHeaders) {
                stringBuilder.append(" ");
                Headers headers = clone.headers();
                for (int i = 0, count = headers.size(); i < count; i++) {
                    stringBuilder.append("\t" + headers.name(i) + ": " + headers.value(i)).append("\n");
                }
                stringBuilder.append(" ");
                if (logBody && HttpHeaders.hasBody(clone)) {
                    if (isPlaintext(responseBody.contentType())) {
                        String body = responseBody.string();
                        stringBuilder.append("\n\tresponse url:" + response.request().url()).append("\n");
                        stringBuilder.append("\tresponse body:" + body).append("\n");
                        responseBody = ResponseBody.create(responseBody.contentType(), body);
                        return response.newBuilder().body(responseBody).build();
                    } else {
                        stringBuilder.append("\tbody: maybe [file part] , too large too print , ignored!").append("\n");;
                    }
                }
                stringBuilder.append(" ");
            }
        } catch (Exception e) {
            e(e);
        } finally {
            stringBuilder.append("<-- END HTTP");
            log(stringBuilder.toString());
        }
        return response;
    }

    /**
     * Returns true if the body in question probably contains human readable text. Uses a small sample
     * of code points to detect unicode control characters commonly used in binary file signatures.
     */
    static boolean isPlaintext(MediaType mediaType) {
        if (mediaType == null) return false;
        if (mediaType.type() != null && mediaType.type().equals("text")) {
            return true;
        }
        String subtype = mediaType.subtype();
        if (subtype != null) {
            subtype = subtype.toLowerCase();
            if (subtype.contains("x-www-form-urlencoded") ||
                    subtype.contains("json") ||
                    subtype.contains("xml") ||
                    subtype.contains("html")) //
                return true;
        }
        return false;
    }

    private void bodyToString(Request request) {
        try {
            final Request copy = request.newBuilder().build();
            final Buffer buffer = new Buffer();
            copy.body().writeTo(buffer);
            Charset charset = UTF8;
            MediaType contentType = copy.body().contentType();
            if (contentType != null) {
                charset = contentType.charset(UTF8);
            }
            StringBuilder logBuilder = new StringBuilder();
            logBuilder.append("\n\trequest url:" + request.url());
            logBuilder.append(("\n\trequest body:" + URLDecoder.decode(buffer.readString(charset), UTF8.name())));
            log(logBuilder.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void e(Throwable t) {
        if (isLogEnable) t.printStackTrace();
    }
}