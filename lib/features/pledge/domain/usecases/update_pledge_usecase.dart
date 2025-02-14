import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';
import 'package:seven_days/features/pledge/domain/repository/pledge_repository.dart';

class UpdatePledgeUsecase {
  final PledgeRepository repository;

  const UpdatePledgeUsecase({required this.repository});

  Future<Either<Failure, Pledge>> call({required Pledge pledge}) async {
    return await repository.updatePledge(pledge: pledge);
  }
}
