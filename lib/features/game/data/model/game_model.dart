import 'package:seven_days/core/enums/game_status.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';

class GameModel extends Game {
  const GameModel({
    required super.id,
    required super.gameStatus,
    required super.challenge,
    required super.players,
    required super.pledges,
  });

  factory GameModel.fromJson({required Map<String, dynamic> json}) {
    return GameModel(
      id: json['id'],
      gameStatus: GameStatus.fromJson(name: json['status']),
      challenge: json['challenge'],
      players: json['players'],
      pledges: json['pledges'],
    );
  }
}
