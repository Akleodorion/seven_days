import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';
import 'package:seven_days/features/pledge/domain/repository/pledge_repository.dart';

class FetchPledgesUsecase {
  final PledgeRepository repository;

  const FetchPledgesUsecase({required this.repository});

  Future<Either<Failure, List<Pledge>>> call() async {
    return await repository.fetchPledges();
  }
}
