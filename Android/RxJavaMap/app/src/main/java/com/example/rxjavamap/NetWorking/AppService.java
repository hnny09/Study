package com.example.rxjavamap.NetWorking;

import android.util.Log;

import com.example.rxjavamap.NetWorking.Api.AppApi;
import com.example.rxjavamap.NetWorking.Model.LoggedInfo;
import com.example.rxjavamap.NetWorking.Model.QuickUserLoginRequest;

import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;

public class AppService {
    static String TAG = AppService.class.getSimpleName();
    public static Disposable  Login(AppApi appService, UCCallback<LoggedInfo> callback){
        UCCallbackWrapper wrapper = new UCCallbackWrapper(callback);
        Disposable disposable = appService.quickUserLogin(new QuickUserLoginRequest())
        .compose(RxUtil.<LoggedInfo>_io_main())
        .map(new BaseBeanDataFunc<LoggedInfo>())
        .doOnNext(new Consumer<LoggedInfo>() {
            @Override
            public void accept(LoggedInfo loggedInfo) throws Exception {
                Log.d(TAG, "accept: " + loggedInfo.getAccessToken());
            }
        }).subscribe(wrapper.getOnNext(), wrapper.getOnError(), wrapper.getOnComplete(),wrapper.getOnSubscribe());
        return disposable;
    }

}
