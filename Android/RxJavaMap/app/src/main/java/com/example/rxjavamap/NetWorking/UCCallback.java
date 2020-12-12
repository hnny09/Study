package com.example.rxjavamap.NetWorking;


public interface UCCallback<T> {

    void onSuccess(T body);

    void onError(String errorCode, Throwable e);

    void onCompleted();

}
