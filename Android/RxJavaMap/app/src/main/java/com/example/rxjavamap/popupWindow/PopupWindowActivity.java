package com.example.rxjavamap.popupWindow;

import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.PopupWindow;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.example.rxjavamap.R;
import com.example.rxjavamap.R2;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class PopupWindowActivity extends AppCompatActivity {

    @BindView(R2.id.bv_back) Button bvBack;
    @BindView(R2.id.bv_popup) Button bvPop;

    private PopupWindow popupWindow;
    
    private String TAG = PopupWindowActivity.class.getSimpleName();
    
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_popupwindow);
        ButterKnife.bind(this);

    }

    @OnClick(R2.id.bv_back)
    void back(){
        Log.d(TAG, "back: ");
        finish();

    }

    @OnClick(R2.id.bv_popup)
    void popup(){
        Log.d(TAG, "popup: ");
        this.getPopupWindow().showAsDropDown(bvPop);

    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy: ");
        
    }

    public PopupWindow getPopupWindow() {
        if (popupWindow == null) {
            popupWindow = new PopupWindow(this);
            popupWindow.setWidth(ViewGroup.LayoutParams.WRAP_CONTENT);
            popupWindow.setHeight(ViewGroup.LayoutParams.WRAP_CONTENT);
            View contentView = LayoutInflater.from(this).inflate(R.layout.layout_selectitem,null);
            popupWindow.setContentView(contentView);
            popupWindow.setBackgroundDrawable(new ColorDrawable(0x00000000));
            popupWindow.setOutsideTouchable(false);
            popupWindow.setFocusable(true);

            View.OnClickListener listener = new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Button button = (Button)v;
                    Log.d(TAG, "onClick: "+ button.getText());
                    popupWindow.dismiss();
                }
            };

            Button button = contentView.findViewById(R.id.bv_first);
            button.setOnClickListener(listener);

            Button button2 = contentView.findViewById(R.id.bv_seconder);
            button2.setOnClickListener(listener);


            Button button3 = contentView.findViewById(R.id.bv_cancel);
            button3.setOnClickListener(listener);

        }
        return popupWindow;
    }
}
