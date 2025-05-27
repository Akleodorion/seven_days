import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/enums/game_status.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/layouts/decided_layout.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/layouts/ongoing_layout.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/layouts/over_layout.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';

class LiveGamePage extends ConsumerWidget {
  const LiveGamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.read(gameProvider);
    final Map<GameStatus, Widget> map = {
      GameStatus.ongoing: OngoingLayout(game: game!),
      GameStatus.over: OverLayout(),
      GameStatus.decided: DecidedLayout(game: game),
    };
    return map[game.gameStatus] ?? CircularProgressIndicator();
  }
}
