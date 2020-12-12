package com.example.rxjavamap.NetWorking;


public class ServerException extends RuntimeException {
    private String errCode;
    private String message;

    public ServerException(String errCode, String msg) {
        super(msg);
        this.errCode = errCode;
        this.message = msg;
    }

    public String getErrCode() {
        return errCode;
    }

    @Override
    public String getMessage() {
        return message;
    }
}