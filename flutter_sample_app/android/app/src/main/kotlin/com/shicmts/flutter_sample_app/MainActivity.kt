package com.shicmts.flutter_sample_app

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.shicmts.flutter_sample_app"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        this.flutterEngine?.let {
            MethodChannel(it.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
                // Note: this method is invoked on the main thread.
                if (call.method == "getBatteryLevel") {
                    val batteryLevel = getBatteryLevel()

                    if (batteryLevel != -1)
                        result.success(batteryLevel)
                    else
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                } else if (call.method == "showToast") {
                    Toast.makeText(this, "토스트를 구워요~", Toast.LENGTH_LONG).show()
                } else if(call.method == "getUserList") {
                    val email = call.argument<String>("email")
                    val password = call.argument<String>("password")

                    if(email == "aaa" && password == "aaa")
                        result.success("100")
                } else {
                    result.notImplemented()
                }
            }
        }

    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }


}
