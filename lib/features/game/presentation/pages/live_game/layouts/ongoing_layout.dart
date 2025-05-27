import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/presentation/providers/update_game_provider.dart';

class OngoingLayout extends ConsumerWidget {
  final Game game;
  const OngoingLayout({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              await ref.read(updateGameProvider.notifier).updateGame(
                    game: game,
                  );
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
