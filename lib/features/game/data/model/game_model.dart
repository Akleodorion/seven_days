import 'package:seven_days/core/enums/game_status.dart';
import 'package:seven_days/features/challenge/data/model/challenge_model.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/pledge/data/model/pledge_model.dart';

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
      challenge: ChallengeModel.fromJson(json: json['challenge']),
      players: json['players'],
      pledges: List.generate(json['pledges'].length,
          (i) => PledgeModel.fromJson(json: json['pledges'][i])),
    );
  }
}
