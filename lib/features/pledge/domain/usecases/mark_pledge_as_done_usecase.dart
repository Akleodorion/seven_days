import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';
import 'package:seven_days/features/pledge/domain/repository/pledge_repository.dart';

class MarkPledgeAsDoneUsecase {
  final PledgeRepository repository;
  const MarkPledgeAsDoneUsecase({required this.repository});

  Future<Either<Failure, Pledge>> call(
      {required Pledge pledge, required Player player}) async {
    return await repository.markPledgeAsDone(pledge: pledge, player: player);
  }
}
