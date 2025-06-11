import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/challenge/domain/usecases/fetch_challenges_usecase.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/fetch_challenges_state.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/notifiers/fetch_challenges_notifier.dart';
import 'package:seven_days/injection_container.dart';

final fetchChallengesProvider =
    StateNotifierProvider<FetchChallengesNotifier, FetchChallengesState>((ref) {
  final FetchChallengesUsecase fetchChallengesUsecase =
      sl<FetchChallengesUsecase>();
  return FetchChallengesNotifier(
      fetchChallengesUsecase: fetchChallengesUsecase);
});

final playerChallenges = Provider((ref) {
  final state = ref.watch(fetchChallengesProvider);

  if (state is Loaded) {
    state.challenges;
  }
  return [];
});
