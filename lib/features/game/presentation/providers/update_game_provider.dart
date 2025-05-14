import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/domain/usecases/update_game_usecase.dart';
import 'package:seven_days/features/game/presentation/providers/notifiers/update_game_notifier.dart';
import 'package:seven_days/features/game/presentation/providers/states/update_game_state.dart';
import 'package:seven_days/injection_container.dart';

final updateGameProvider =
    StateNotifierProvider<UpdateGameNotifier, UpdateGameState>((ref) {
  final UpdateGameUsecase updateGameUsecase = sl<UpdateGameUsecase>();
  return UpdateGameNotifier(updateGameUsecase: updateGameUsecase);
});
