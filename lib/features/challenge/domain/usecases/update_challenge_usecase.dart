import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/repository/challenge_repository.dart';

class UpdateChallengeUsecase {
  final ChallengeRepository repository;

  UpdateChallengeUsecase({required this.repository});

  Future<Either<Failure, Challenge>> call(
      {required Challenge challenge}) async {
    return await repository.updateChallenge(challenge: challenge);
  }
}
