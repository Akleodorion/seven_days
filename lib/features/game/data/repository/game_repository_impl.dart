import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/exceptions.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/data/datasources/game_remote_data_source.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/repository/game_repository.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class GameRepositoryImpl implements GameRepository {
  final GameRemoteDataSourceImpl dataSource;

  GameRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, Game?>> activeGame() async {
    try {
      final Game? game = await dataSource.activeGame();
      return Right(game);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Game>> createGame(
      {required List<Player> players}) async {
    try {
      final Game game = await dataSource.createGame(players: players);
      return Right(game);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Game>> updateGame(
      {required Game game, required Player currentPlayer}) async {
    try {
      final Game result =
          await dataSource.updateGame(game: game, currentPlayer: currentPlayer);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
