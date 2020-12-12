package com.example.rxjavamap.NetWorking.Api;

import com.example.rxjavamap.NetWorking.Model.LoggedInfo;
import com.example.rxjavamap.NetWorking.Model.QuickUserLoginRequest;

import io.reactivex.Observable;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface AppApi {

    @POST(AppServerUrls.QuickUserLogin)
    Observable<LoggedInfo> quickUserLogin(@Body QuickUserLoginRequest body);


}
