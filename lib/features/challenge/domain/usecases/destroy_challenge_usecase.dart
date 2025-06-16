import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/repository/challenge_repository.dart';

class DestroyChallengeUsecase {
  final ChallengeRepository repository;

  const DestroyChallengeUsecase({required this.repository});

  Future<Either<Failure, void>> call({required Challenge challenge}) async {
    return await repository.destroyChallenge(challenge: challenge);
  }
}
