import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/decided_text_widget.dart';
import 'package:seven_days/features/game/presentation/providers/update_game_provider.dart';

class DecidedLayout extends ConsumerWidget {
  final Game game;
  const DecidedLayout({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text(
            game.gameStatus.name,
          ),
          Text(
            game.challenge.description,
          ),
          Text("Arrêter par: ${game.endedBy}"),
          for (var player in game.players)
            DecidedTextWidget(game: game, player: player),
          ElevatedButton(
            onPressed: () {
              ref.read(updateGameProvider.notifier).updateGame(game: game);
            },
            child: Text("Archiver la partie"),
          )
        ],
      ),
    );
  }
}
