import 'package:flutter/material.dart';
import 'package:flutter_sample_app/view/page/players/player_main.dart';
import 'package:flutter_sample_app/view/page/project/project_main.dart';
import 'page/drawer/drawer_root_controller.dart';
import 'page/chart/candle_chart_main.dart';
import 'page/home/home_page_main.dart';

import 'page/drawer/drawer_list.dart';

/// 여기는 알파처럼 탭뷰, 바텀네비게이션, 사이드메뉴 등등의 기본 포맷 구현
class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  Widget screenView = const HomePageMain();
  DrawerIndex drawerIndex = DrawerIndex.home;

  @override
  Widget build(BuildContext context) {
    return DrawerRootController(
        screenIndex: drawerIndex,
        drawerWidth: MediaQuery.of(context).size.width * 0.75,
        onDrawerCall: (DrawerIndex drawerIndexdata) {
          changeIndex(drawerIndexdata);
        },
        screenView: screenView);
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.home) {
        if (mounted) {
          setState(() {
            screenView = const HomePageMain();
          });
        }
      } else if (drawerIndex == DrawerIndex.player) {
        if (mounted) {
          setState(() {
            screenView = const PlayerMain();
          });
        }
      } else if (drawerIndex == DrawerIndex.chart) {
        if (mounted) {
          setState(() {
            screenView = CandleChart();
          });
        }
      } else if (drawerIndex == DrawerIndex.project) {
        if (mounted) {
          setState(() {
            screenView = const ProjectMain();
          });
        }
      }
    }
  }
}
