import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/game/domain/repository/game_repository.dart';

class ActiveGameUsecase {
  final GameRepository repository;

  const ActiveGameUsecase({required this.repository});

  Future<Either<Failure, Game?>> call() async {
    return await repository.activeGame();
  }
}
