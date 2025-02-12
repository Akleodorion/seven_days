import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

abstract class ChallengeRemoteDataSource {
  Future<List<Challenge>> fetchChallenges();
  Future<Challenge> updateChallenge();
  Future<Challenge> createChallenge();
}

class ChallengeRemoteDataSourceImpl implements ChallengeRemoteDataSource {
  @override
  Future<Challenge> createChallenge() {
    // TODO: implement createChallenge
    throw UnimplementedError();
  }

  @override
  Future<List<Challenge>> fetchChallenges() {
    // TODO: implement fetchChallenges
    throw UnimplementedError();
  }

  @override
  Future<Challenge> updateChallenge() {
    // TODO: implement updateChallenge
    throw UnimplementedError();
  }
}
