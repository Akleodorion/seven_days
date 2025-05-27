import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/live_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/retry_active_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/start_game_page.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';
import 'package:seven_days/features/player/presentation/providers/fetch_players_provider.dart';

class MainPageRouter extends ConsumerStatefulWidget {
  const MainPageRouter({super.key});

  @override
  ConsumerState<MainPageRouter> createState() => _MainPageRouterState();
}

class _MainPageRouterState extends ConsumerState<MainPageRouter> {
  Future<ActiveGameState> _activeGameState() async {
    final state = ref.watch(activeGameProvider);
    return state;
  }

  @override
  void initState() {
    ref.read(fetchPlayersProvider.notifier).fetchPlayer();
    ref.read(activeGameProvider.notifier).activeGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _activeGameState(),
      builder: (context, snapshot) {
        return router(
          state: snapshot.data,
        );
      },
    );
  }
}

Widget router({required ActiveGameState? state}) {
  Widget widget = Placeholder();
  if (state is Loaded && state.game == null) {
    widget = StartGamePage();
  } else if (state is Loaded && state.game != null) {
    widget = LiveGamePage();
  } else if (state is Error) {
    widget = RetryActiveGamePage();
  } else {
    widget = CircularProgressIndicator();
  }
  return widget;
}
