import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/domain/repository/challenge_repository.dart';

class FetchChallengesUsecase {
  final ChallengeRepository repository;

  FetchChallengesUsecase({required this.repository});

  Future<Either<Failure, List<Challenge>>> call() async {
    return await repository.fetchChallenges();
  }
}
