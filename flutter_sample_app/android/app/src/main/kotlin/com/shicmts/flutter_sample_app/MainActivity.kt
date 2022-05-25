package com.shicmts.flutter_sample_app

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    companion object {
    const val CHANNEL = 'com.sample.shicmts'
  }
  
  override fun onCreate(savedInstanceState: Bundle?){
  // 건들지 않기(원래있는코드)
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith... 
    
    MethodChannel(flutterView, CHANNEL)
    .setMethodVallHandler {
      methodCall, result => if(methodCall.method == 'getUserList') {
        result.success("성공")
      }
      else {
      	result.notImplemented()
      }
    }
  }
}
