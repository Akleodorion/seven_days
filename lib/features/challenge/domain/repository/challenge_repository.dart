import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

abstract class ChallengeRepository {
  Future<Either<Failure, List<Challenge>>> fetchChallenges();
  Future<Either<Failure, void>> createChallenge();
  Future<Either<Failure, Challenge>> updateChallenge();
}
