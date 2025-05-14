import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/usecases/active_game_usecase.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';

class ActiveGameNotifier extends StateNotifier<ActiveGameState> {
  final ActiveGameUsecase activeGameUsecase;

  ActiveGameNotifier({required this.activeGameUsecase}) : super(Unloaded());

  Future<ActiveGameState> activeGame() async {
    state = Loading();

    final Either<Failure, Game?> result = await activeGameUsecase.call();
    result.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(errorMessage: failure.errorMessage, game: null);
      }
    }, (game) {
      state = Loaded(game: game);
    });

    return state;
  }
}
