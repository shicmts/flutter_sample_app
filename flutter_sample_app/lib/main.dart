import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/root_page.dart';

Future<void> main() async {
  // 비동기 메서드를 위한 처리
  // runApp 메소드의 시작 지점에서 Flutter 엔진과 위젯의 바인딩이 미리 완료되어 있게함
  WidgetsFlutterBinding.ensureInitialized();
  // 오리엔테이션 고정된 후 runApp
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
        Platform.isAndroid && !kIsWeb ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: '보글보글 플러터',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
          body: SafeArea(
            bottom: false,
            child: RootPage()
          )
      ),
    );
  }
}
