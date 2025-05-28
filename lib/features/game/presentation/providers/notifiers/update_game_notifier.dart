import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/usecases/update_game_usecase.dart';
import 'package:seven_days/features/game/presentation/providers/states/update_game_state.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class UpdateGameNotifier extends StateNotifier<UpdateGameState> {
  final UpdateGameUsecase updateGameUsecase;

  UpdateGameNotifier({required this.updateGameUsecase}) : super(Unloaded());

  Future<UpdateGameState> updateGame(
      {required Game game, required Player currentPlayer}) async {
    state = Loading();

    final Either<Failure, Game> response =
        await updateGameUsecase.call(game: game, currentPlayer: currentPlayer);

    response.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(errorMessage: failure.errorMessage, game: null);
      }
    }, (game) {
      state = Loaded(game: game);
    });
    return state;
  }
}
