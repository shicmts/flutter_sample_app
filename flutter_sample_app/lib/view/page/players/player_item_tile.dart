import 'package:flutter/material.dart';

import '/../../../../model/player.dart';

class PlayerItemTile extends StatelessWidget {
  final Player player;
  late final Image osImage;
  PlayerItemTile({required this.player}) {
    if (player.os == OS.android) {
      osImage = Image.asset("images/android.png");
    } else {
      osImage = Image.asset("images/apple.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(player.name),
      leading: osImage,
      onTap: () {},
    );
  }
}
