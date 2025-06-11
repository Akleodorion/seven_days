import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/player/domain/usecases/current_player_usecase.dart';
import 'package:seven_days/features/player/presentation/providers/states/current_player_state.dart';

class CurrentPlayerNotifier extends StateNotifier<CurrentPlayerState> {
  final CurrentPlayerUsecase currentPlayerUsecase;

  CurrentPlayerNotifier({required this.currentPlayerUsecase})
      : super(Loading());

  Future<CurrentPlayerState> currentPlayer() async {
    final response = await currentPlayerUsecase.call();
    response.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(
          message: failure.errorMessage,
          player: null,
        );
      }
    }, (success) {
      state = Loaded(player: success);
    });
    return state;
  }

  updateCurrentPlayerChallengeList({required Challenge newChallenge}) {
    if (state is! Loaded) return state;

    final loadedState = state as Loaded;
    final player = loadedState.player;
    state = Loading();
    final newChallenges = List<Challenge>.from(player.challenges)
      ..add(newChallenge);

    final newPlayer = player.copyWith(challenges: newChallenges);
    state = Loaded(player: newPlayer);
  }
}
