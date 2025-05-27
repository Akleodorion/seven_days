import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';

class RetryActiveGamePage extends ConsumerWidget {
  const RetryActiveGamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(activeGameProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state is Error ? state.errorMessage : "Une erreur s'est produite",
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              await ref.read(activeGameProvider.notifier).activeGame();
            },
            label: Text('retry'),
          )
        ],
      ),
    );
  }
}
