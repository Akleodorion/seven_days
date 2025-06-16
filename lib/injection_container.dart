import 'package:get_it/get_it.dart';
import 'package:seven_days/features/challenge/data/datasources/challenge_remote_data_source.dart';
import 'package:seven_days/features/challenge/data/repository/challenge_repository_impl.dart';
import 'package:seven_days/features/challenge/domain/repository/challenge_repository.dart';
import 'package:seven_days/features/challenge/domain/usecases/create_challenge_usecase.dart';
import 'package:seven_days/features/challenge/domain/usecases/destroy_challenge_usecase.dart';
import 'package:seven_days/features/challenge/domain/usecases/fetch_challenges_usecase.dart';
import 'package:seven_days/features/challenge/domain/usecases/update_challenge_usecase.dart';
import 'package:seven_days/features/game/data/datasources/game_remote_data_source.dart';
import 'package:seven_days/features/game/data/repository/game_repository_impl.dart';
import 'package:seven_days/features/game/domain/repository/game_repository.dart';
import 'package:seven_days/features/game/domain/usecases/active_game_usecase.dart';
import 'package:seven_days/features/game/domain/usecases/create_game_usecase.dart';
import 'package:seven_days/features/game/domain/usecases/update_game_usecase.dart';
import 'package:seven_days/features/player/data/datasources/player_remote_data_source.dart';
import 'package:seven_days/features/player/data/repository/player_repository_impl.dart';
import 'package:seven_days/features/player/domain/repository/player_repository.dart';
import 'package:seven_days/features/player/domain/usecases/current_player_usecase.dart';
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

  sl.registerFactory<CurrentPlayerUsecase>(
      () => CurrentPlayerUsecase(repository: sl()));

  // Repository
  sl.registerFactory<PlayerRepository>(
      () => PlayerRepositoryImpl(dataSource: sl()));

  // Datasources
  sl.registerFactory<PlayerRemoteDataSourceImpl>(
      () => PlayerRemoteDataSourceImpl());

  //* Feature: Challenge
  // Usecases
  sl.registerFactory<CreateChallengeUsecase>(
      () => CreateChallengeUsecase(repository: sl()));
  sl.registerFactory<DestroyChallengeUsecase>(
      () => DestroyChallengeUsecase(repository: sl()));
  sl.registerFactory<FetchChallengesUsecase>(
      () => FetchChallengesUsecase(repository: sl()));
  sl.registerFactory<UpdateChallengeUsecase>(
      () => UpdateChallengeUsecase(repository: sl()));

  // Repository
  sl.registerFactory<ChallengeRepository>(
      () => ChallengeRepositoryImpl(dataSource: sl()));

  // Datasources
  sl.registerFactory<ChallengeRemoteDataSource>(
      () => ChallengeRemoteDataSourceImpl());
}
