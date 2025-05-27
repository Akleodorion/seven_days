import 'package:seven_days/core/enums/pledge_status.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';

class PledgeModel extends Pledge {
  const PledgeModel({
    required super.id,
    required super.targetId,
    required super.playerId,
    required super.status,
    required super.description,
    required super.gameId,
  });

  factory PledgeModel.fromJson({required Map<String, dynamic> json}) {
    return PledgeModel(
      id: json['id'],
      targetId: json['target_id'],
      playerId: json['player_id'],
      status: PledgeStatus.fromJson(statusName: json['status']),
      description: json['description'],
      gameId: json['game_id'],
    );
  }
}
