import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/create_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/player/presentation/providers/fetch_players_provider.dart';

class StartGamePage extends StatelessWidget {
  const StartGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, builder) {
            final players = ref.read(playersProvider);
            return IconButton.outlined(
              onPressed: () async {
                final state = await ref
                    .read(createGameProvider.notifier)
                    .createGame(players: players as List<Player>);
                if (state is Loaded) {
                  ref.read(activeGameProvider.notifier).activeGame();
                }
              },
              icon: Icon(
                Icons.power_settings_new_outlined,
                color: Colors.green,
              ),
            );
          }),
          SizedBox(
            height: 5,
          ),
          Text(
            "Cliquez pour commencer une partie",
          ),
        ],
      ),
    );
  }
}
