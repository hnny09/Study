package com.example.rxjavamap.NetWorking;

import android.util.Log;

import com.example.rxjavamap.NetWorking.Model.BaseResponseData;

import io.reactivex.functions.Function;

public class BaseBeanDataFunc<T> implements Function<T,T> {
    String TAG = BaseBeanDataFunc.class.getSimpleName();
    @Override
    public T apply(T tBaseResponseData) throws Exception {
        Log.d(TAG, "apply: " + tBaseResponseData.getClass().getSimpleName());
        return tBaseResponseData;
    }
}
