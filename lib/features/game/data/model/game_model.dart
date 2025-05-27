import 'package:seven_days/core/enums/game_status.dart';
import 'package:seven_days/features/challenge/data/model/challenge_model.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/player/data/model/player_model.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/pledge/data/model/pledge_model.dart';

class GameModel extends Game {
  const GameModel({
    required super.id,
    required super.stoppedBy,
    required super.gameStatus,
    required super.challenge,
    required super.players,
    required super.loosers,
    required super.winners,
    required super.pledges,
    required super.endDate,
  });

  factory GameModel.fromJson({required Map<String, dynamic> json}) {
    final List<Player> players = (json['players'] as List)
        .map<PlayerModel>((json) => PlayerModel.fromJson(json: json))
        .toList();
    return GameModel(
        id: json['id'],
        stoppedBy: players.cast<Player?>().firstWhere(
              (p) => p?.id == json['stopped_by'],
              orElse: () => null,
            ),
        gameStatus: GameStatus.fromJson(name: json['status']),
        challenge: ChallengeModel.fromJson(json: json['challenge']),
        players: players,
        loosers: players
            .where((p) => (json['loosers'] as List).contains(p.id))
            .toList(),
        winners: players
            .where((p) => (json['winners'] as List).contains(p.id))
            .toList(),
        pledges: (json['pledges'] as List)
            .map((e) => PledgeModel.fromJson(json: e))
            .toList(),
        endDate: DateTime.parse(
          json['end_date'],
        ));
  }
}
