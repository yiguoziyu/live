package com.yiguoziyu.live

import android.app.Activity
import android.app.Application
import io.flutter.view.FlutterMain

/**
 * Created by 一锅子鱼 on 2018/8/1.
 */
class App private constructor():Application() {
    private var mCurrentActivity: Activity? = null



    override fun onCreate() {
        super.onCreate()
        FlutterMain.startInitialization(this)
    }

    fun getCurrentActivity(): Activity? {
        return this.mCurrentActivity
    }

    fun setCurrentActivity(mCurrentActivity: Activity) {
        this.mCurrentActivity = mCurrentActivity
    }
}