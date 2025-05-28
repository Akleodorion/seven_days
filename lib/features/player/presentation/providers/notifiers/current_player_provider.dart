import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/player/domain/usecases/current_player_usecase.dart';
import 'package:seven_days/features/player/presentation/providers/notifiers/current_player_notifier.dart';
import 'package:seven_days/features/player/presentation/providers/states/current_player_state.dart';
import 'package:seven_days/injection_container.dart';

final currentPlayerProvider =
    StateNotifierProvider<CurrentPlayerNotifier, CurrentPlayerState>((ref) {
  final CurrentPlayerUsecase currentPlayerUsecase = sl<CurrentPlayerUsecase>();
  return CurrentPlayerNotifier(currentPlayerUsecase: currentPlayerUsecase);
});

final playerProvider = Provider((ref) {
  final state = ref.watch(currentPlayerProvider);
  if (state is Loaded) {
    return state.player;
  }

  return null;
});
