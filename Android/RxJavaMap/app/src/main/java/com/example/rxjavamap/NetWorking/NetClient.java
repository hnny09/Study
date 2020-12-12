package com.example.rxjavamap.NetWorking;


import android.util.Log;

import com.example.rxjavamap.BuildConfig;
import com.example.rxjavamap.NetWorking.Converter.GsonConverterFactory;
import com.google.gson.Gson;

import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;

public class NetClient {

    private Retrofit retrofit;

    public void init(NetConfig config){
        OkHttpClient.Builder builder = new OkHttpClient.Builder();
        builder.readTimeout(10, TimeUnit.SECONDS);
        builder.connectTimeout(10,TimeUnit.SECONDS);
        String TAG = NetClient.class.getSimpleName();
        if (BuildConfig.DEBUG){
            HttpLoggingInterceptor interceptor = new HttpLoggingInterceptor(TAG,true);
            interceptor.setLevel(HttpLoggingInterceptor.Level.BODY);
            builder.addInterceptor(interceptor);
        } else {
            Log.d(TAG, "init: Release");
        }

        Retrofit.Builder retrofitBuilder = new Retrofit.Builder();
        retrofitBuilder.baseUrl(config.baseUrl);
        retrofitBuilder.addConverterFactory(GsonConverterFactory.create());
        retrofitBuilder.addCallAdapterFactory(RxJava2CallAdapterFactory.create());
        retrofitBuilder.client(builder.build());

        retrofit = retrofitBuilder.build();
    }

    public Retrofit getRetrofit(){
        return retrofit;
    }


}
