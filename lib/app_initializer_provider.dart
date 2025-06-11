import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/player/presentation/providers/fetch_players_provider.dart';
import 'package:seven_days/features/player/presentation/providers/current_player_provider.dart';

final appInitializerProvider = FutureProvider((ref) async {
  await ref.read(currentPlayerProvider.notifier).currentPlayer();
  await ref.read(fetchPlayersProvider.notifier).fetchPlayer();
  await ref.read(activeGameProvider.notifier).activeGame();
});
