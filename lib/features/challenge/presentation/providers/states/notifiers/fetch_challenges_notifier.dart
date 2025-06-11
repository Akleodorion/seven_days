import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/usecases/fetch_challenges_usecase.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/fetch_challenges_state.dart';

class FetchChallengesNotifier extends StateNotifier<FetchChallengesState> {
  final FetchChallengesUsecase fetchChallengesUsecase;

  FetchChallengesNotifier({required this.fetchChallengesUsecase})
      : super(Loading());

  Future<FetchChallengesState> fetchChallenges() async {
    final data = await fetchChallengesUsecase.call();
    data.fold((failure) {
      state = Error(challenges: null, errorMessage: 'Oops');
    }, (success) {
      state = Loaded(challenges: success);
    });
    return state;
  }

  FetchChallengesState setChallenges({required List<Challenge> challenges}) {
    state = Loading();
    state = Loaded(challenges: challenges);

    return state;
  }

  appendChallengeList({required Challenge challenge}) {
    if (state is! Loaded) return;

    final loadedState = state as Loaded;
    final newChallenges = List<Challenge>.from(loadedState.challenges)
      ..add(challenge);
    loadedState.copyWith(challenges: newChallenges);
  }
}
