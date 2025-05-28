import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
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
}
