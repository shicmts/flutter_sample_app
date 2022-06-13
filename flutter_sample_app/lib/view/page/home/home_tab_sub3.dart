import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample_app/model/player.dart';
import '../players/player_main.dart';

class HomeTabSub3 extends StatefulWidget {
  HomeTabSub3State createState() => HomeTabSub3State();
}

class HomeTabSub3State extends State<HomeTabSub3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PlayerMain());
  }
}
