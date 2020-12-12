package com.example.rxjavamap.NetWorking;

import org.apache.http.conn.ConnectTimeoutException;

import java.net.ConnectException;
import java.net.UnknownHostException;

import retrofit2.HttpException;

/**
 * Created by wenping.li on 2018/3/14.
 */

public class ExceptionUtil {
    public static RxNetException handleException(Throwable e) {
        RxNetException ex;
        if (e instanceof HttpException) {
            HttpException httpException = (HttpException) e;
            ex = new RxNetException(httpException, httpException.code() + "");
            switch (httpException.code()) {
                case RxNetException.BAD_REQUEST:
                case RxNetException.UNAUTHORIZED:
                case RxNetException.FORBIDDEN:
                case RxNetException.NOT_FOUND:
                case RxNetException.REQUEST_TIMEOUT:
                case RxNetException.GATEWAY_TIMEOUT:
                case RxNetException.INTERNAL_SERVER_ERROR:
                case RxNetException.BAD_GATEWAY:
                case RxNetException.METHOD_NOT_ALLOWED:
                case RxNetException.SERVICE_UNAVAILABLE:
                default:
                    ex.message = "net error,Code:" + httpException.code() + " ,err:" + httpException.getMessage();
                    break;
            }
            ex.message = httpException.getMessage();
            return ex;
        } else if (e instanceof ServerException) {
            ServerException resultException = (ServerException) e;
            ex = new RxNetException(resultException, resultException.getErrCode());
            ex.message = resultException.getMessage();
            return ex;
        }
//        else if (
        // add fastjson
//                e instanceof com.alibaba.fastjson.JSONException
//                        ||
//                e instanceof JsonParseException
//                ||
//                        e instanceof JSONException
//                || e instanceof JsonSyntaxException
//                || e instanceof JsonSerializer
//                        || e instanceof NotSerializableException
//                        || e instanceof ParseException) {
//            ex = new RxNetException(e, ExceptionCodeConstants.PARSE_ERROR + "");
//            ex.message = "解析错误";
//            ex.message = ExceptionMsgConstants.PARSE_ERROR;
//            return ex;
//        }
        else if (e instanceof ClassCastException) {
            ex = new RxNetException(e, ExceptionCodeConstants.CAST_ERROR + "");
//            ex.message = "类型转换错误";
            ex.message = ExceptionMsgConstants.CAST_ERROR;
            return ex;
        } else if (e instanceof ConnectException) {
            ex = new RxNetException(e, ExceptionCodeConstants.NETWORD_ERROR + "");
//            ex.message = "连接失败";
            ex.message = ExceptionMsgConstants.NETWORK_ERROR;
            return ex;
        } else if (e instanceof javax.net.ssl.SSLHandshakeException) {
            ex = new RxNetException(e, ExceptionCodeConstants.SSL_ERROR + "");
//            ex.message = "证书验证失败";
            ex.message = ExceptionMsgConstants.SSL_ERROR;
            return ex;
        } else if (e instanceof ConnectTimeoutException) {
            ex = new RxNetException(e, ExceptionCodeConstants.TIMEOUT_ERROR + "");
//            ex.message = "连接超时";
            ex.message = ExceptionMsgConstants.TIMEOUT_ERROR;
            return ex;
        } else if (e instanceof java.net.SocketTimeoutException) {
            ex = new RxNetException(e, ExceptionCodeConstants.TIMEOUT_ERROR + "");
//            ex.message = "连接超时";
            ex.message = ExceptionMsgConstants.TIMEOUT_ERROR;
            return ex;
        } else if (e instanceof UnknownHostException) {
            ex = new RxNetException(e, ExceptionCodeConstants.UNKNOWN_HOST_ERROR + "");
//            ex.message = "无法解析该域名";
            ex.message = ExceptionMsgConstants.UNKNOWN_HOST_ERROR;
            return ex;
        } else if (e instanceof NullPointerException) {
            ex = new RxNetException(e, ExceptionCodeConstants.NULLPOINTER_EXCEPTION + "");
//            ex.message = "NullPointerException";
            ex.message = ExceptionMsgConstants.NULL_POINTER_EXCEPTION;
            return ex;
        } else {
            ex = new RxNetException(e, ExceptionCodeConstants.UNKNOWN + "");
//            ex.message = "未知错误";
            ex.message = ExceptionMsgConstants.UNKNOWN_ERROR;
            return ex;
        }
    }

}
