import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/exceptions.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/player/data/datasources/player_remote_data_source.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/player/domain/repository/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerRemoteDataSourceImpl dataSource;

  PlayerRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Player>>> fetchPlayers() async {
    try {
      final data = await dataSource.fetchPlayer();
      return Right(data);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(errorMessage: failure.errorMessage),
      );
    }
  }
}
