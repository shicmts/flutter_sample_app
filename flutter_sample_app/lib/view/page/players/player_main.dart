import 'package:flutter/material.dart';
import 'package:flutter_sample_app/repository/player_repository.dart';
import 'package:flutter_sample_app/view/page/players/player_item_tile.dart';

import '../../../model/player.dart';
import '../../../theme/app_theme.dart';

class PlayerMain extends StatefulWidget {
  const PlayerMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerMainState();

}

class _PlayerMainState extends State<PlayerMain> {
  final List<Player> players = PlayerRepository().getPlayers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.mainBlue,
          title: const Text("보글보글 플러터")
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
            itemCount: players.length,
            itemBuilder: (context, index){
              return PlayerItemTile(player: players[index]);
            }),
      )
    );
  }

}