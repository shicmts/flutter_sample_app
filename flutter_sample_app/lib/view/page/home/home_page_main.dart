import 'package:flutter/material.dart';
import 'package:flutter_sample_app/theme/app_theme.dart';
import 'home_tab_main.dart';
import 'home_tab_sub1.dart';
import 'home_tab_sub2.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> with SingleTickerProviderStateMixin {
  static const List<Tab> _tabs = [
    Tab(text: "메인"),
    Tab(text: "서브1"),
    Tab(text: "서브2"),
  ];

  static final List<Widget> _views = [
    HomeTabMain(),
    HomeTabSub1(), //statefulwidget으로 const 제거
    HomeTabSub2(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppTheme.mainBlue,
            title: const Text("보글보글 플러터"),
            bottom: const TabBar(tabs: _tabs)
        ),
        body: TabBarView(children: _views),
      ),
    );
  }


}
