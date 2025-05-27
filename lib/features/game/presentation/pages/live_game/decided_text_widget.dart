import 'package:flutter/material.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class DecidedTextWidget extends StatelessWidget {
  final Game game;
  final Player player;
  const DecidedTextWidget(
      {super.key, required this.game, required this.player});

  @override
  Widget build(BuildContext context) {
    final bool isWinner = game.winners.contains(player);
    String content = "a perdu";
    if (isWinner) content = "a gagné";
    return Text(
      "${player.name} $content",
      style: TextStyle(color: isWinner ? Colors.green : Colors.red),
    );
  }
}
