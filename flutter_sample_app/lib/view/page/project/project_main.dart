import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../theme/app_theme.dart';

class ProjectMain extends StatefulWidget {
  const ProjectMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProjectMainState();
}

class _ProjectMainState extends State<ProjectMain> {
  @override
  void initState() {
    super.initState();
    // 웹 뷰 실행
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppTheme.mainBlue,
            title: const Text("보글보글 플러터")),
        body: WebView(
          initialUrl: 'https://github.com/shicmts/flutter_sample_app',
          javascriptMode: JavascriptMode.unrestricted,
          gestureRecognizers: Set()
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()
              ..onTapDown = (tap) {
                print("This one prints");
              })),
        ));
  }
}
