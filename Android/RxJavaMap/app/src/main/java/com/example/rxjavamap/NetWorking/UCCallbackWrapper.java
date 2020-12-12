package com.example.rxjavamap.NetWorking;

import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;

public class UCCallbackWrapper<T> {

    UCCallback<T> callback;

    private Consumer<T> onNext;
    private Consumer<Throwable> onError;
    private Action onComplete;
    private Consumer<Disposable> onSubscribe;

    public UCCallbackWrapper(final UCCallback<T> callback){
        this.callback = callback;

        onNext = new Consumer<T>() {
            @Override
            public void accept(T t) throws Exception {
                if (callback != null){
                    callback.onSuccess(t);
                }
            }
        };


        onError = new Consumer<Throwable>() {
            @Override
            public void accept(Throwable throwable) throws Exception {
                if (callback != null){
                    callback.onError("7777777",throwable);
                }
            }
        };


        onComplete = new Action() {
            @Override
            public void run() throws Exception {
                if (callback != null) {
                    callback.onCompleted();
                }
            }
        };

        onSubscribe = new Consumer<Disposable>() {
            @Override
            public void accept(Disposable disposable) throws Exception {

            }
        };
    }

    public UCCallback<T> getCallback() {
        return callback;
    }

    public Consumer<T> getOnNext() {
        return onNext;
    }

    public Consumer<Throwable> getOnError() {
        return onError;
    }

    public Action getOnComplete() {
        return onComplete;
    }

    public Consumer<Disposable> getOnSubscribe() {
        return onSubscribe;
    }
}
