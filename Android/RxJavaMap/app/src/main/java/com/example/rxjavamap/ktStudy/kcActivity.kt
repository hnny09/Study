package com.example.rxjavamap.ktStudy

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.example.rxjavamap.R
import java.util.*

class kcActivity : AppCompatActivity(){

    var name: String = ""
    val age : String = "13"
    var le = "zhansan"
    val lv = null

    private var TAG :String? = kcActivity::class.simpleName

    private val back : Button by lasy{
        findViewById<Button>(R.id.bv_back);

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_ktstudy)

        name = makeTool("zhansan")

        var list = ArrayList<String>()


    }
    fun makeTool(value:String):String{
            return value + "aaaaa"
    }


}