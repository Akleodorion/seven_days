import 'package:get_it/get_it.dart';
import 'package:seven_days/features/game/data/datasources/game_remote_data_source.dart';
import 'package:seven_days/features/game/data/repository/game_repository_impl.dart';
import 'package:seven_days/features/game/domain/repository/game_repository.dart';
import 'package:seven_days/features/game/domain/usecases/active_game_usecase.dart';
import 'package:seven_days/features/game/domain/usecases/create_game_usecase.dart';
import 'package:seven_days/features/game/domain/usecases/update_game_usecase.dart';
import 'package:seven_days/features/player/data/datasources/player_remote_data_source.dart';
import 'package:seven_days/features/player/data/repository/player_repository_impl.dart';
import 'package:seven_days/features/player/domain/repository/player_repository.dart';
import 'package:seven_days/features/player/domain/usecases/fetch_players_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //* Feature: Game
  // Usecases
  sl.registerFactory<ActiveGameUsecase>(
    () => ActiveGameUsecase(repository: sl()),
  );

  sl.registerFactory<CreateGameUsecase>(
    () => CreateGameUsecase(repository: sl()),
  );

  sl.registerFactory<UpdateGameUsecase>(
    () => UpdateGameUsecase(repository: sl()),
  );
  // Repository
  sl.registerFactory<GameRepository>(
    () => GameRepositoryImpl(
      dataSource: sl(),
    ),
  );
  // Datasources
  sl.registerFactory<GameRemoteDataSourceImpl>(
    () => GameRemoteDataSourceImpl(),
  );

  //* Feature: Player
  // Usecases
  sl.registerFactory<FetchPlayersUsecase>(
      () => FetchPlayersUsecase(repository: sl()));

  // Repository
  sl.registerFactory<PlayerRepository>(
      () => PlayerRepositoryImpl(dataSource: sl()));

  // Datasources
  sl.registerFactory<PlayerRemoteDataSourceImpl>(
      () => PlayerRemoteDataSourceImpl());
}
