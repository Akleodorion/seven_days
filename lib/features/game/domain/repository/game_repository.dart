import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

abstract class GameRepository {
  Future<Either<Failure, Game>> createGame({required List<Player> players});
  Future<Either<Failure, Game>> updateGame(
      {required Game game, required Player currentPlayer});
  Future<Either<Failure, Game?>> activeGame();
}
