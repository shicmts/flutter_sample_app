import 'package:flutter/material.dart';
import 'package:flutter_sample_app/view/page/home/home_page_main.dart';

/// 여기는 알파처럼 탭뷰, 바텀네비게이션, 사이드메뉴 등등의 기본 포맷 구현
class RootPage extends StatelessWidget {
  RootPage({Key? key, required this.i}) : super(key: key);

  final int i;
  final pages = [
    const HomePageMain(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
            child: const HomePageMain()));
  }
}
