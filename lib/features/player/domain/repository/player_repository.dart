import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

abstract class PlayerRepository {
  Future<Either<Failure, List<Player>>> fetchPlayers();
}
