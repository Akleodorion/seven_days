import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/challenge/domain/repository/challenge_repository.dart';

class FetchChallengeUsecase {

  final ChallengeRepository repository;

  FetchChallengeUsecase({required this.repository});

  Future<Either<Failure, void>> call() async {
    return await repository.fetchChallenges();
  }
}
