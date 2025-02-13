import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/repository/challenge_repository.dart';

class ChallengeRepositoryImpl implements ChallengeRepository {
  @override
  Future<Either<Failure, Challenge>> createChallenge() {
    // TODO: implement createChallenge
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Challenge>>> fetchChallenges() {
    // TODO: implement fetchChallenges
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Challenge>> updateChallenge() {
    // TODO: implement updateChallenge
    throw UnimplementedError();
  }
}
