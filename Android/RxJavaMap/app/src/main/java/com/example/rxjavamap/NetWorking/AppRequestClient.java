package com.example.rxjavamap.NetWorking;

import com.example.rxjavamap.NetWorking.Api.AppApi;

import io.reactivex.disposables.Disposable;

public class AppRequestClient {

    private  static volatile  AppRequestClient client;

    private AppRequestClient(){

    }

    public void init(){
        NetClient netClient = new NetClient();
        NetConfig netConfig = new NetConfig();
        netConfig.baseUrl = "http://58.251.37.197:10136";
        netClient.init(netConfig);
        APP.appServive = netClient.getRetrofit().create(AppApi.class);
    }

    public static class APP{
        private static AppApi appServive;

        public static Disposable Login(UCCallback callback) {
            return  AppService.Login(appServive, callback);
        }
    }

    public static AppRequestClient getInstance(){

        if (client == null) {
            synchronized (AppRequestClient.class){
                if (client == null) {
                    client = new AppRequestClient();
                    client.init();
                }
            }
        }

        return client;
    }
}
