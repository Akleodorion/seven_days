import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/repository/game_repository.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class CreateGameUsecase {
  final GameRepository repository;

  CreateGameUsecase({required this.repository});

  Future<Either<Failure, Game>> call({required List<Player> players}) async {
    return await repository.createGame(players: players);
  }
}
