import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/usecases/destroy_challenge_usecase.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/destroy_challenge_state.dart';

class DestroyChallengeNotifier extends StateNotifier<DestroyChallengeState> {
  final DestroyChallengeUsecase destroyChallengeUsecase;

  DestroyChallengeNotifier({required this.destroyChallengeUsecase})
      : super(Unloaded());

  Future<DestroyChallengeState> destroyChallenge(
      {required Challenge challenge}) async {
    state = Loading();
    var result = await destroyChallengeUsecase.call(challenge: challenge);
    result.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(errorMessage: failure.errorMessage);
      }
    }, (success) {
      state = Loaded();
    });
    return state;
  }
}
