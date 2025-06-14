import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/exceptions.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/data/datasources/challenge_remote_data_source.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/repository/challenge_repository.dart';

typedef FutureChallenge = Future<Challenge>;

class ChallengeRepositoryImpl implements ChallengeRepository {
  final ChallengeRemoteDataSource dataSource;

  ChallengeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Challenge>>> fetchChallenges() async {
    try {
      final List<Challenge> challenges = await dataSource.fetchChallenges();
      return Right(challenges);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Challenge>> createChallenge(
      {required Challenge challenge}) async {
    return _executeChallenge(dataSource.createChallenge(challenge: challenge));
  }

  @override
  Future<Either<Failure, Challenge>> updateChallenge(
      {required Challenge challenge}) async {
    return _executeChallenge(dataSource.updateChallenge(challenge: challenge));
  }

  Future<Either<Failure, Challenge>> _executeChallenge(
    FutureChallenge challengeOperation,
  ) async {
    try {
      final Challenge challenge = await challengeOperation;
      return Right(challenge);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
