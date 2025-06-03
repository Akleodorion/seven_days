import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/usecases/create_challenge_usecase.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/create_challenge_state.dart';

class CreateChallengeNotifier extends StateNotifier<CreateChallengeState> {
  final CreateChallengeUsecase createChallengeUsecase;

  CreateChallengeNotifier({required this.createChallengeUsecase})
      : super(Unloaded());

  Future<CreateChallengeState> createChallenge(
      {required Challenge challenge}) async {
    state = Loading();
    var result = await createChallengeUsecase.call(challenge: challenge);
    result.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(challenge: challenge, errorMessage: failure.errorMessage);
      }
    }, (success) {
      state = Loaded(challenge: challenge);
    });
    return state;
  }
}
