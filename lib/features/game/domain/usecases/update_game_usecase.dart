import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/repository/game_repository.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class UpdateGameUsecase {
  final GameRepository repository;

  UpdateGameUsecase({required this.repository});

  Future<Either<Failure, Game>> call(
      {required Game game, required Player currentPlayer}) async {
    return await repository.updateGame(
        game: game, currentPlayer: currentPlayer);
  }
}
