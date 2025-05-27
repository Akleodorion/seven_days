import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/usecases/active_game_usecase.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class ActiveGameNotifier extends StateNotifier<ActiveGameState> {
  final ActiveGameUsecase activeGameUsecase;

  ActiveGameNotifier({required this.activeGameUsecase}) : super(Loading());

  Future<ActiveGameState> activeGame() async {
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

  ActiveGameState toggleLooserWinner(Player player, bool isWinner) {
    if (state is! Loaded) return state;

    final loadedState = state as Loaded;
    final game = loadedState.game;

    final newWinners = List<Player>.from(game!.winners);
    final newLoosers = List<Player>.from(game.loosers);

    if (isWinner) {
      if (!newWinners.contains(player)) newWinners.add(player);
      newLoosers.removeWhere((p) => p.id == player.id);
    } else {
      if (!newLoosers.contains(player)) newLoosers.add(player);
      newWinners.removeWhere((p) => p.id == player.id);
    }

    final updatedGame = game.copyWith(
      winners: newWinners,
      loosers: newLoosers,
    );

    final newState = loadedState.copyWith(game: updatedGame);
    state = newState;
    return newState;
  }
}
