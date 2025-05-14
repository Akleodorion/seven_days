import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/domain/usecases/create_game_usecase.dart';
import 'package:seven_days/features/game/presentation/providers/notifiers/create_game_notifier.dart';
import 'package:seven_days/features/game/presentation/providers/states/create_game_state.dart';
import 'package:seven_days/injection_container.dart';

final createGameProvider =
    StateNotifierProvider<CreateGameNotifier, CreateGameState>((ref) {
  final CreateGameUsecase createGameUsecase = sl<CreateGameUsecase>();
  return CreateGameNotifier(createGameUsecase: createGameUsecase);
});
