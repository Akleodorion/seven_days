import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/states/update_game_state.dart';
import 'package:seven_days/features/game/presentation/providers/update_game_provider.dart';
import 'package:seven_days/features/player/presentation/providers/notifiers/current_player_provider.dart';

class OngoingLayout extends ConsumerWidget {
  final Game game;
  const OngoingLayout({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlayer = ref.read(playerProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            game.gameStatus.name,
          ),
          Text(
            game.challenge.description,
          ),
          Text(
            game.endDate.toString(),
          ),
          IconButton.outlined(
            onPressed: () async {
              final state = await ref
                  .read(updateGameProvider.notifier)
                  .updateGame(game: game, currentPlayer: currentPlayer!);
              if (state is Loaded) {
                ref.read(activeGameProvider.notifier).activeGame();
              }
            },
            icon: Icon(
              Icons.power_settings_new_rounded,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
