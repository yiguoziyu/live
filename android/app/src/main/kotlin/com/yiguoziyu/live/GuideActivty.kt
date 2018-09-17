package com.yiguoziyu.live

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View

/**
 * Created by 一锅子鱼 on 2018/7/29.
 */
class GuideActivty : Activity(){
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_guide)
    }

    fun onClick(view: View?) {
        val intent = Intent(this, MainActivity::class.java)
        startActivity(intent)
    }
}