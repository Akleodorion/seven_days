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

  factory PlayerModel.fromJson({
    required Map<String, dynamic> playerMap,
    required List<dynamic> challengeMap,
    required List<dynamic> pledgeMap,
    required List<dynamic> targetMap,
  }) {
    return PlayerModel(
      id: playerMap['id'],
      name: playerMap['name'],
      challenges:
          challengeMap.map((e) => ChallengeModel.fromJson(json: e)).toList(),
      pledges: pledgeMap.map((e) => PledgeModel.fromJson(json: e)).toList(),
      targetPledge:
          targetMap.map((e) => PledgeModel.fromJson(json: e)).toList(),
    );
  }
}
