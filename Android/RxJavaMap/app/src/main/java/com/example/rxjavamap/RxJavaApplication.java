package com.example.rxjavamap;

import android.app.Application;
import android.util.Log;

import com.example.rxjavamap.event.MessageEvent;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

public class RxJavaApplication extends Application {

    private String TAG = RxJavaApplication.class.getSimpleName();

    @Override
    public void onCreate() {
        super.onCreate();
        Log.d(TAG, "onCreate: ");

        initEventBus();

    }

    public void initEventBus(){

        EventBus.getDefault().register(this);

    }

    @Subscribe(threadMode = ThreadMode.BACKGROUND)
    public void busEvent(MessageEvent messageEvent){
        Log.d(TAG, "busEvent: "+messageEvent.getMessage());
        Log.d(TAG, "busEvent: "+Thread.currentThread().getName());

    }

    @Override
    public void onTerminate() {
        super.onTerminate();
        EventBus.getDefault().unregister(this);
    }
}
