import 'package:flutter/material.dart';

import '../model/player.dart';

class PlayerRepository{

  final List<Player> _dummyPlayers = [
    Player(id: 0, name: "김나경", os: OS.android),
    Player(id: 0, name: "김하정", os: OS.iOS),
  ];

  List<Player> getPlayers(){
    return _dummyPlayers;
  }

}