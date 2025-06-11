import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/live_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/start_game_page.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ActiveGameState state = ref.watch(activeGameProvider);
    Widget displayedPage = CircularProgressIndicator();

    if (state is Loaded && state.game == null) {
      displayedPage = StartGamePage();
    }

    if (state is Loaded && state.game != null) {
      displayedPage = LiveGamePage();
    }

    return displayedPage;
  }
}
