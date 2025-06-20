import 'package:dartz/dartz.dart';
import 'package:seven_days/core/errors/failures.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/player/domain/repository/player_repository.dart';

class CurrentPlayerUsecase {
  final PlayerRepository repository;

  const CurrentPlayerUsecase({required this.repository});

  Future<Either<Failure, Player>> call() async {
    return await repository.currentPlayer();
  }
}
