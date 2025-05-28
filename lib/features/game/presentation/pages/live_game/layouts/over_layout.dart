import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/states/update_game_state.dart';
import 'package:seven_days/features/game/presentation/providers/update_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart'
    as ag;
import 'package:seven_days/features/player/presentation/providers/notifiers/current_player_provider.dart';

class OverLayout extends ConsumerWidget {
  const OverLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(activeGameProvider);
    final currentPlayer = ref.read(playerProvider);

    if (state is! ag.Loaded || state.game == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final game = state.game!;
    return Center(
      child: Column(
        children: [
          Text(
            game.gameStatus.name,
          ),
          Text(
            game.challenge.description,
          ),
          for (var player in game.players)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(game.winners.contains(player) ||
                        game.loosers.contains(player)
                    ? player.name
                    : 'Definir le status'),
                Switch(
                    value: game.winners.contains(player),
                    onChanged: (value) {
                      ref
                          .read(activeGameProvider.notifier)
                          .toggleLooserWinner(player, value);
                    }),
              ],
            ),
          ElevatedButton(
            onPressed: () async {
              final state = await ref
                  .read(updateGameProvider.notifier)
                  .updateGame(game: game, currentPlayer: currentPlayer!);
              if (state is Loaded) {
                ref.read(activeGameProvider.notifier).activeGame();
              }
            },
            child: Text("Décider de la partie"),
          ),
          Text(
            "Arretée par: ${game.endedBy}",
          ),
        ],
      ),
    );
  }
}
