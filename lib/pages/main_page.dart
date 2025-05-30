import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/app_initializer_provider.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/player/presentation/providers/notifiers/current_player_provider.dart';
import 'package:seven_days/pages/main_page_router.dart';

class Mainpage extends ConsumerWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final init = ref.watch(appInitializerProvider);
    return init.when(
      data: (_) {
        final state = ref.watch(activeGameProvider);
        final currentPlayer = ref.read(playerProvider);
        return MainPageRouter(
          state: state,
          currentPlayer: currentPlayer!,
        );
      },
      error: (error, _) {
        return Center(
          child: Text("Une erreur est survenue"),
        );
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
