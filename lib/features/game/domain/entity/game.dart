import 'package:equatable/equatable.dart';
import 'package:seven_days/core/enums/game_status.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';

class Game extends Equatable {
  final int id;
  final GameStatus gameStatus;
  final Challenge challenge;
  final List<Player> players;
  final List<Pledge> pledges;

  const Game({
    required this.id,
    required this.gameStatus,
    required this.challenge,
    required this.players,
    required this.pledges,
  });

  @override
  List<Object?> get props => [
        id,
        gameStatus,
        challenge,
        players,
        pledges,
      ];
}
