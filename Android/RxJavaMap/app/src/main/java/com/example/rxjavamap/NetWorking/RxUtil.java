package com.example.rxjavamap.NetWorking;

import android.util.Log;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.ObservableTransformer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;

public class RxUtil {
    public String TAG = RxUtil.class.getSimpleName();
    static <T> ObservableTransformer<T, T> _io_main(){
        return new ObservableTransformer<T, T>() {
            @Override
            public ObservableSource<T> apply(Observable<T> upstream) {
                return upstream
                        .subscribeOn(Schedulers.io())
                        .unsubscribeOn(Schedulers.io())
                        .doOnSubscribe(new Consumer<Disposable>() {
                            @Override
                            public void accept(Disposable disposable) throws Exception {
                                Log.d("RxUtil", "accept: Start");
                            }
                        })
                        .doFinally(new Action() {
                            @Override
                            public void run() throws Exception {
                                Log.d("RxUtil", "run: Finally");
                            }
                        })
                        .observeOn(AndroidSchedulers.mainThread())
                        .onErrorResumeNext(new HttpResponseFunc<T>());
            }
        };
    }

}
