import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/repository/game_repository.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class GameRepositoryImpl implements GameRepository {
  @override
  Future<Either<Failure, Game?>> activeGame() {
    // TODO: implement activeGame
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Game>> createGame({required List<Player> players}) {
    // TODO: implement createGame
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Game>> updateGame({required int gameId}) {
    // TODO: implement updateGame
    throw UnimplementedError();
  }
}
