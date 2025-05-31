import 'package:seven_days/features/challenge/data/model/challenge_model.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/pledge/data/model/pledge_model.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required super.id,
    required super.name,
    required super.challenges,
    required super.pledges,
    required super.targetPledge,
  });

  factory PlayerModel.fromJson({required Map<String, dynamic> json}) {
    return PlayerModel(
      id: json['player']['id'],
      name: json['player']['name'],
      challenges: (json['challenges'] as List)
          .map((e) => ChallengeModel.fromJson(json: e))
          .toList(),
      pledges: (json['pledges'] as List)
          .map((e) => PledgeModel.fromJson(json: e))
          .toList(),
      targetPledge: (json['target_pledges'] as List)
          .map((e) => PledgeModel.fromJson(json: e))
          .toList(),
    );
  }
}
