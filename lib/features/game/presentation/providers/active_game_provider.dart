import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/domain/usecases/active_game_usecase.dart';
import 'package:seven_days/features/game/presentation/providers/notifiers/active_game_notifier.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';
import 'package:seven_days/injection_container.dart';

final activeGameProvider =
    StateNotifierProvider<ActiveGameNotifier, ActiveGameState>((ref) {
  final ActiveGameUsecase activeGameUsecase = sl<ActiveGameUsecase>();
  return ActiveGameNotifier(activeGameUsecase: activeGameUsecase);
});
