import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';

abstract class PledgeRepository {
  Future<Either<Failure, List<Pledge>>> fetchPledges();
  Future<Either<Failure, Pledge>> createPledge({required Pledge pledge});
  Future<Either<Failure, Pledge>> updatePledge({required Pledge pledge});
}
