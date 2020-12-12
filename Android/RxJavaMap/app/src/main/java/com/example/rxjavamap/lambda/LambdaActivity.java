package com.example.rxjavamap.lambda;

import android.os.Bundle;
import android.util.Log;
import android.view.View;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.example.rxjavamap.R;
import com.example.rxjavamap.R2;

import butterknife.ButterKnife;
import butterknife.OnClick;

public class LambdaActivity extends AppCompatActivity implements View.OnClickListener{

    public static String TAG = LambdaActivity.class.getSimpleName();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lambda);
        ButterKnife.bind(this);
        studyFirst();
    }

    public static void getData(String arg){
        Log.d(TAG, "getData: "+arg);
    }

    public void  studyFirst(){

        View.OnClickListener listener = v -> {

        };

        Runnable runnable = () -> {

        };


        RequestTask task1 = (arg1, arg2) -> {
            LambdaTest.getData(arg1,arg2);
        };

        RequestTask task2 = LambdaTest::getData;


        task2.requestData("zhangsan",false);
        task1.requestData("zahang",false);

    }

    @Override
    public void onClick(View v) {

    }


    static class LambdaTest{

        public static void getData(String arg1, boolean arg2){
            Log.d(TAG, "getData: " + arg1 + arg2 );
        }

    }


    interface RequestTask{
        void requestData(String arg1, boolean arg2);

    }













    @OnClick(R2.id.bv_back)
    void back(){
        finish();
    }

}
