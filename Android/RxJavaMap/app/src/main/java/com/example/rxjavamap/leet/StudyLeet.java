package com.example.rxjavamap.leet;

import android.util.Log;

public class StudyLeet {
    public static String TAG = StudyLeet.class.getSimpleName();
    public static void start(){

        Log.d(TAG,"================除法================");
        StudyLeet studyLeet = new StudyLeet();
        int res = studyLeet.divide(100,9);
        Log.d(TAG,"100/9 = " + res);
    }

    /**
     * 除法
     * @param dividend
     * @param divisor
     * @return
     */
    public int divide(int dividend, int divisor){

        if (dividend == 0) return 0;
        if (divisor == 1) return dividend;
        if (divisor == -1) return -dividend;

        int cur = dividend;
        int div = divisor;
        int sign = 1;
        if ((cur > 0 && div < 0) || (cur < 0 && div >0)) sign = -1;
        cur = cur > 0 ? cur : -cur;
        div = div > 0 ? div : -div;
        int res = div(cur,div);
        if (sign > 0)return res;
        else return -res;

    }

    /**
     * 求商
     * @param a
     * @param b
     * @return
     */
    public int div(int a, int b){
        if (a < b) return 0;
        int count = 1;
        int tb = b;
        while (tb + tb <= a){
            count = count + count;
            tb = tb + tb;
        }
        return  count + div(a-tb,b);
    }

}
