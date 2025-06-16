import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

abstract class ChallengeRepository {
  Future<Either<Failure, List<Challenge>>> fetchChallenges();
  Future<Either<Failure, Challenge>> createChallenge(
      {required Challenge challenge});
  Future<Either<Failure, Challenge>> updateChallenge(
      {required Challenge challenge});
  Future<Either<Failure, void>> destroyChallenge(
      {required Challenge challenge});
}
