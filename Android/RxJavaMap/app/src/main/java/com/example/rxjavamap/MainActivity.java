package com.example.rxjavamap;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.nfc.Tag;
import android.os.Bundle;

import com.example.rxjavamap.NetWorking.AppRequestClient;
import com.example.rxjavamap.NetWorking.Model.LoggedInfo;
import com.example.rxjavamap.NetWorking.UCCallback;
import com.example.rxjavamap.event.MessageEvent;
import com.example.rxjavamap.lambda.LambdaActivity;
import com.example.rxjavamap.leet.StudyLeet;
import com.example.rxjavamap.node.StudyNode;
import com.example.rxjavamap.popupWindow.PopupWindowActivity;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.gson.Gson;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.util.Log;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.TextView;

import org.greenrobot.eventbus.EventBus;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;


public class MainActivity extends AppCompatActivity implements View.OnClickListener {
   private String TAG = MainActivity.class.getSimpleName();

   private CompositeDisposable compositeDisposable = new CompositeDisposable();

   private Button bvLogin;

   private Button bvWhiteButton;
   private Button bvBlackButton;
   private TextView tvContent;
   @BindView(R2.id.bv_lambda) Button lambdaButton;

   private final String day = "Day";
   private final String night = "Night";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Resources.Theme theme = getTheme();
        SharedPreferences sharedPreferences = getSharedPreferences("aa", Context.MODE_PRIVATE);
        String id = sharedPreferences.getString("aaa","");
        Log.d(TAG, "onCreate: "+id);
        if (id.equalsIgnoreCase("")){
            SharedPreferences.Editor editor = sharedPreferences.edit();
            editor.putString("aaa",day);
            editor.commit();
            setTheme(R.style.customTheme_Day);
        } else  {
            if (id.equalsIgnoreCase(day)){
                setTheme(R.style.customTheme_Day);

            } else {
                setTheme(R.style.customTheme_Night);
            }
        }
        setContentView(R.layout.activity_main);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        try {
            this.getApplicationContext().getPackageManager().getPackageInfo(this.getApplicationContext().getPackageName(),0);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        FloatingActionButton fab = findViewById(R.id.fab);

        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, PopupWindowActivity.class);
                startActivity(intent);
            }
        });


        initRequestService();

        bvLogin = findViewById(R.id.bv_login);

        bvLogin.setOnClickListener(this);

        ButterKnife.bind(this);

//        StudyTheme();
//        StudyDefer();

//        StudyGson();



//        StudyRXJavaFirst();
//        StudyRxJavaFlatMap();
//        StudyRxJavaMap();


//        StudyRxJavaZip();
//        StudyRxJavaFlowable();
        
         List<String> parenthesis = generateParenthesis(3);
         Log.d(TAG, parenthesis.toString());

        StudyNode.Start();
        StudyLeet.start();
    }


    //回溯算法
    public List<String> generateParenthesis(int n){
        List<String> ans = new ArrayList<String>();
        backtrack(ans,new StringBuilder(),0,0,n);
        return ans;
    }

    public void backtrack(List<String> ans, StringBuilder builder,int open ,int close, int max){
        if (builder.length() == max * 2){
            ans.add(builder.toString());
            return;
        }
        if (open < max){
            builder.append("(");
            Log.d(TAG,"one-add:" + builder.toString());
            backtrack(ans,builder,open +1 ,close,max);
            builder.deleteCharAt(builder.length() -1);
            Log.d(TAG,"one-del:" + builder.toString());
        }
        if (open > close) {
            builder.append(")");
            Log.d(TAG,"two-add:" + builder.toString());
            backtrack(ans,builder,open,close+1,max);
            builder.deleteCharAt(builder.length() - 1);
            Log.d(TAG,"two-del:" + builder.toString());
        }

    }

    @OnClick(R2.id.bv_lambda)
    void goToLambdaActivity(){
        Log.d(TAG, "goToLambdaActivity: ");
        Intent intent = new Intent(this, LambdaActivity.class);
        startActivity(intent);
    }

    public void sendMessageEvnet(){
        MessageEvent messageEvent = new  MessageEvent("zhangsan");
        EventBus.getDefault().post(messageEvent);
    }

    public void StudyTheme(){
        bvBlackButton = findViewById(R.id.bt_black);
        bvWhiteButton = findViewById(R.id.bt_white);
        tvContent = findViewById(R.id.tv_content);

        bvWhiteButton.setOnClickListener(this);
        bvBlackButton.setOnClickListener(this);
    }


    @Override
    public void onClick(View v) {
        SharedPreferences sharedPreferences = getSharedPreferences("aa",Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        switch (v.getId()){
            case R.id.bv_login:
                sendMessageEvnet();
                //StartRequestLogin();
                break;
            case R.id.bt_black:
                setTheme(R.style.customTheme_Night);
                editor.putString("aaa",night);
                editor.commit();
                this.recreate();
                Log.d(TAG, "onClick: black model");
                break;
            case R.id.bt_white:
                setTheme(R.style.customTheme_Day);
                editor.putString("aaa",day);
                editor.commit();
                this.recreate();
                Log.d(TAG, "onClick: white model");
                break;
            default:
                break;
        }


    }
    
    public void initRequestService(){
        AppRequestClient.getInstance();
    }
    
    public void StartRequestLogin(){

        compositeDisposable.clear();
    
         Disposable disposable = AppRequestClient.APP.Login(new UCCallback<LoggedInfo>() {

            @Override
            public void onSuccess(LoggedInfo body) {

            }

            @Override
            public void onError(String errorCode, Throwable e) {

            }

            @Override
            public void onCompleted() {

            }
        });

         compositeDisposable.add(disposable);
    }


    public void StudyRxJavaFlowable(){
        Flowable<Integer> upstream = Flowable.create(new FlowableOnSubscribe<Integer>() {
            @Override
            public void subscribe(FlowableEmitter<Integer> emitter) throws Exception {
                emitter.onNext(1);
                emitter.onNext(2);
                emitter.onNext(3);
            }
        }, BackpressureStrategy.ERROR).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());

        Subscriber<Integer> downstream = new Subscriber<Integer>() {

            private  Subscription subscription;

            @Override
            public void onSubscribe(Subscription s) {
                Log.d(TAG, "onSubscribe: ");
//                s.request(Long.MAX_VALUE);
//                s.cancel();
                s.request(1);
                subscription = s;
            }

            @Override
            public void onNext(Integer integer) {
                Log.d(TAG, "onNext: "+integer);
                if (integer == 1) {
                    try {
                        Log.d(TAG, "onSubscribe: sleep--start");
                        Thread.sleep(1000);
                        Log.d(TAG, "onSubscribe: sleep--end");
                        subscription.request(1);
                    } catch (Throwable throwable){
                    }
                }
            }

            @Override
            public void onError(Throwable t) {
                Log.d(TAG, "onError: " + t);
            }



            @Override
            public void onComplete() {
                Log.d(TAG, "onComplete: ");
            }
        };

        upstream.subscribe(downstream);


    }

    public void StudyRxJavaZip(){
        Observable observable = Observable.create(new ObservableOnSubscribe() {
            @Override
            public void subscribe(ObservableEmitter emitter) throws Exception {
                Thread.sleep(1000);
                Log.d(TAG, "subscribe: 1");
                Thread.sleep(1000);
                emitter.onNext(1);
                Log.d(TAG, "subscribe: 2");
                emitter.onNext(2);

            }
        }).subscribeOn(Schedulers.io());


        Observable observable1 = Observable.create(new ObservableOnSubscribe() {
            @Override
            public void subscribe(ObservableEmitter emitter) throws Exception {
                Log.d(TAG, "subscribe: A");
                emitter.onNext("A");
                emitter.onNext("B");
                emitter.onNext("C");
            }
        }).subscribeOn(Schedulers.io());


        Observable observable2 = Observable.zip(observable, observable1, new BiFunction() {
            @Override
            public Object apply(Object o, Object o2) throws Exception {
                return "" + o + o2;
            }
        });

        observable2.subscribe(new Consumer() {
            @Override
            public void accept(Object o) throws Exception {
                Log.d(TAG, "accept: "+o);
            }
        });


    }

    public void StudyRxJavaFlatMap(){
        Observable observable = Observable.create(new ObservableOnSubscribe<Integer>() {
            @Override
            public void subscribe(ObservableEmitter<Integer> emitter) throws Exception {
                emitter.onNext(1);
                emitter.onNext(2);
                emitter.onComplete();
            }
        });

//       observable = observable.flatMap(new Function<Integer, ObservableSource<String>>() {
//            @Override
//            public ObservableSource<String> apply(Integer o) throws Exception {
//                Log.d(TAG, "apply: "+ o);
//                final List<String> list = new ArrayList<>();
//                for (int i = 0; i < 4; i++) {
//                    list.add("i am value "+ i);
//                }
//                Log.d(TAG, "apply: "+list.toString());
//                return Observable.fromIterable(list).delay(10, TimeUnit.MILLISECONDS);
//            }
//        });
        observable = observable.concatMap(new Function<Integer, ObservableSource<String>>() {
            @Override
            public ObservableSource<String> apply(Integer o) throws Exception {
                Log.d(TAG, "apply: "+ o);
                final List<String> list = new ArrayList<>();
                for (int i = 0; i < 4 * o; i++) {
                    list.add("i am value "+ i);
                }
                Log.d(TAG, "apply: "+list.toString());
                return Observable.fromIterable(list).delay(10, TimeUnit.MILLISECONDS);
            }
        });

       Disposable disposable = observable.subscribe(new Consumer() {
           @Override
           public void accept(Object o) throws Exception {
               Log.d(TAG, "accept: "+o);
           }
       });




    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d(TAG, "onResume: MainActivity");
    }

    public void StudyRXJavaFirst(){

        Observable<Integer> observable = Observable.create(new ObservableOnSubscribe<Integer>() {
            @Override
            public void subscribe(ObservableEmitter<Integer> emitter) throws Exception {
                Log.d(TAG, "subscribe: " + Thread.currentThread().getName());
                emitter.onNext(1);
                emitter.onNext(2);
                emitter.onNext(3);
                emitter.onComplete();
                emitter.onNext(4);
            }
        });


        Observer<Integer> observer = new Observer<Integer>(){

            CompositeDisposable compositeDisposable = new CompositeDisposable();

            @Override
            public void onSubscribe(Disposable d) {
                compositeDisposable.add(d);
                Log.d(TAG,"onSubscribe");
            }

            @Override
            public void onNext(Integer integer) {
                Log.d(TAG, "onNext: "+ Thread.currentThread().getName());
                Log.d(TAG, "onNext: "+integer);
                if (integer > 1) {
                    compositeDisposable.clear();
                }
            }

            @Override
            public void onError(Throwable e) {
                Log.d(TAG, "onError: error");
            }

            @Override
            public void onComplete() {
                Log.d(TAG, "onComplete:");
            }


        };
        observable.subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(observer);
//        Disposable disposable = observable.subscribe(new Consumer<Integer>() {
//            @Override
//            public void accept(Integer integer) throws Exception {
//                Log.d(TAG, "accept: "+integer);
//            }
//        });


    }

    public void StudyGson(){
        Gson gson = new Gson();
        int i = gson.fromJson("100",int.class);
        Log.d(TAG,i + 1 + "");

        double d = gson.fromJson("99.99",double.class);
        Log.d(TAG,d + 1 + "StudyGson: ");

        String jsonNumber = gson.toJson(100);
        Log.d(TAG,jsonNumber);

        String jsonBoolean = gson.toJson(false);
        Log.d(TAG, "StudyGson: "+jsonBoolean);

    }


    public void StudyDefer(){
        rxJavaDeferExample();
    }

    public Observable<Integer> getRxJavaCreateExampleData() {
        return Observable.create(new ObservableOnSubscribe<Integer>() {
            @Override
            public void subscribe(ObservableEmitter<Integer> emitter) {
                Log.d(TAG, "getRxJavaCreateExampleData---:" + Thread.currentThread().getName() + "--:" + 3);
                emitter.onNext(3);
                emitter.onComplete();
                Log.d(TAG, "getRxJavaCreateExampleData---:" + Thread.currentThread().getName() + "--:" + 4);
                emitter.onNext(4);
            }
        });
    }
    public void rxJavaDeferExample() {
      Disposable disposable = Observable.defer(new Callable<ObservableSource<?>>() {
            @Override
            public ObservableSource<?> call() throws Exception {
                return MainActivity.this.getRxJavaCreateExampleData();
            }
        }).subscribeOn(Schedulers.io())
                .unsubscribeOn(Schedulers.io())
//                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Consumer<Object>() {
                    @Override
                    public void accept(Object o) throws Exception {
                        Log.d(TAG, "rxJavaDeferExample--:" + Thread.currentThread().getName() + "-consumer-:" + o.toString());
                    }
                });
//        compositeDisposable.add(disposable);
    }

    public void StudyRxJavaMap(){
        ArrayList<Student> list = new ArrayList<Student>();
        Student one = new Student("zhansan",4);
        Student two = new Student("lisi",5);
        Student three = new Student("wangwu",6);
        list.add(one);
        list.add(two);
        list.add(three);

        Disposable disposable = Observable.create(new ObservableOnSubscribe<Integer>() {
             @Override
             public void subscribe(ObservableEmitter<Integer> emitter) throws Exception {
                 emitter.onNext(1);
                 emitter.onNext(2);
                 emitter.onNext(3);
             }
         }).map(new Function<Integer,String>(){
             @Override
             public String apply(Integer integer) throws  Exception {
                 Log.d("test",integer + "");
                 return "aaaa" + integer;
             }
         }).subscribe(new Consumer<String>() {
             @Override
             public void accept(String s) throws Exception {
                 Log.d("XYK",s);
             }
         });

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }


}
