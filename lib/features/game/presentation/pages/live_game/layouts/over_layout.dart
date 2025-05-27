import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';
import 'package:seven_days/features/game/presentation/providers/update_game_provider.dart';

class OverLayout extends ConsumerWidget {
  const OverLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(activeGameProvider);

    if (state is! Loaded || state.game == null) {
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
            onPressed: () {
              ref.read(updateGameProvider.notifier).updateGame(game: game);
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
