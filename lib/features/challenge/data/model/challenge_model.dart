import 'package:seven_days/core/enums/challenge_status.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

class ChallengeModel extends Challenge {
  const ChallengeModel({
    required super.id,
    required super.playerId,
    required super.gameId,
    required super.description,
    required super.status,
  });

  factory ChallengeModel.fromJson({required Map<String, dynamic> json}) {
    return ChallengeModel(
      id: json['id'],
      playerId: json['player_id'],
      gameId: json['game_id'],
      description: json['description'],
      status: ChallengeStatus.fromJson(name: json['status']),
    );
  }
}
