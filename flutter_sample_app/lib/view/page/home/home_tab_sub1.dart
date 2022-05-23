import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'src/web_view_stack.dart';

/// 여긴 뭐할까
/// 웹뷰 !! 웹뷰 커스텀도 가능할까? 일단은
class HomeTabSub1 extends StatefulWidget {
  HomeTabSub1State createState() => HomeTabSub1State();
}

class HomeTabSub1State extends State<HomeTabSub1> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WebViewStack(),
    );
  }
}
