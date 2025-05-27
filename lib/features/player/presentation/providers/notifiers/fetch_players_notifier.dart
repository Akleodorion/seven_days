import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/player/domain/usecases/fetch_players_usecase.dart';
import 'package:seven_days/features/player/presentation/providers/states/fetch_player_state.dart';

class FetchPlayersNotifier extends StateNotifier<FetchPlayerState> {
  final FetchPlayersUsecase fetchPlayersUsecase;

  FetchPlayersNotifier({required this.fetchPlayersUsecase}) : super(Loading());

  Future<FetchPlayerState> fetchPlayer() async {
    final response = await fetchPlayersUsecase.call();
    response.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(
          message: failure.errorMessage,
          players: null,
        );
      }
    }, (success) {
      state = Loaded(players: success);
    });
    return state;
  }
}
