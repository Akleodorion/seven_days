import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/repository/game_repository.dart';

class UpdateGameUsecase {
  final GameRepository repository;

  UpdateGameUsecase({required this.repository});

  Future<Either<Failure, Game>> call({required Game game}) async {
    return await repository.updateGame(game: game);
  }
}
