import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/usecases/create_game_usecase.dart';
import 'package:seven_days/features/game/presentation/providers/states/create_game_state.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class CreateGameNotifier extends StateNotifier<CreateGameState> {
  final CreateGameUsecase createGameUsecase;

  CreateGameNotifier({
    required this.createGameUsecase,
  }) : super(Unloaded());

  // Usecase

  Future<CreateGameState> createGame({required List<Player> players}) async {
    state = Loading();

    final Either<Failure, Game> response =
        await createGameUsecase.call(players: players);

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
