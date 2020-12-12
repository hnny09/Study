package com.example.rxjavamap.NetWorking;

//import com.google.gson.JsonParseException;
//import com.google.gson.JsonSerializer;
//import com.google.gson.JsonSyntaxException;


public class RxNetException extends Exception {
    //对应HTTP的状态码
    public static final int BAD_REQUEST = 400;
    public static final int UNAUTHORIZED = 401;
    public static final int FORBIDDEN = 403;
    public static final int NOT_FOUND = 404;
    public static final int METHOD_NOT_ALLOWED = 405;
    public static final int REQUEST_TIMEOUT = 408;
    public static final int INTERNAL_SERVER_ERROR = 500;
    public static final int BAD_GATEWAY = 502;
    public static final int SERVICE_UNAVAILABLE = 503;
    public static final int GATEWAY_TIMEOUT = 504;

    private final String code;
    private String displayMessage;

    public static final int UNKNOWN = 1000;
    public static final int PARSE_ERROR = 1001;
    public String message;


    public RxNetException(Throwable throwable, String code) {
        super(throwable);
        this.code = code;
        this.message = throwable.getMessage();
    }

    public String getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }

}