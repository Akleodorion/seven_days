import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/usecases/update_challenge_usecase.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/update_challenge_state.dart';

class UpdateChallengeNotifier extends StateNotifier<UpdateChallengeState> {
  final UpdateChallengeUsecase updateChallengeUsecase;

  UpdateChallengeNotifier({required this.updateChallengeUsecase})
      : super(Unloaded());

  Future<UpdateChallengeState> updateChallenge(
      {required Challenge challenge}) async {
    state = Loading();
    var result = await updateChallengeUsecase.call(challenge: challenge);
    result.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(challenge: null, errorMessage: failure.errorMessage);
      }
    }, (success) {
      state = Loaded(challenge: success);
    });
    return state;
  }
}
