import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';
import 'package:seven_days/features/pledge/domain/repository/pledge_repository.dart';

class DestroyPledgeUsecase {
  final PledgeRepository repository;

  const DestroyPledgeUsecase({required this.repository});

  Future<Either<Failure, void>> call({required Pledge pledge}) async {
    return await repository.destroyPledge(pledge: pledge);
  }
}
