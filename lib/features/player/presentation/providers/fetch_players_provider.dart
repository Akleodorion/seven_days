import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/player/domain/usecases/fetch_players_usecase.dart';
import 'package:seven_days/features/player/presentation/providers/notifiers/fetch_players_notifier.dart';
import 'package:seven_days/features/player/presentation/providers/states/fetch_player_state.dart';
import 'package:seven_days/injection_container.dart';

final fetchPlayersProvider =
    StateNotifierProvider<FetchPlayersNotifier, FetchPlayerState>((ref) {
  final FetchPlayersUsecase fetchPlayersUsecase = sl<FetchPlayersUsecase>();
  return FetchPlayersNotifier(fetchPlayersUsecase: fetchPlayersUsecase);
});

final playersProvider = Provider((ref) {
  final state = ref.watch(fetchPlayersProvider);
  if (state is Loaded) {
    return state.players;
  } else if (state is Error) {
    return state.players;
  } else {
    return [];
  }
});
