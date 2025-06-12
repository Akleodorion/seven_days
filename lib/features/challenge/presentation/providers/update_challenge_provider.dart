import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/challenge/domain/usecases/update_challenge_usecase.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/notifiers/update_challenge_notifier.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/update_challenge_state.dart';
import 'package:seven_days/injection_container.dart';

final updateChallengeProvider =
    StateNotifierProvider<UpdateChallengeNotifier, UpdateChallengeState>((ref) {
  final UpdateChallengeUsecase updateChallengeUsecase =
      sl<UpdateChallengeUsecase>();
  return UpdateChallengeNotifier(
      updateChallengeUsecase: updateChallengeUsecase);
});

final playerChallenges = Provider((ref) {
  final state = ref.watch(updateChallengeProvider);

  if (state is Loaded) {
    state.challenge;
  }
  return null;
});
