import 'package:seven_days/features/pledge/domain/entity/pledge.dart';

class PledgeModel extends Pledge {
  const PledgeModel({
    required super.challengeId,
    required super.id,
    required super.description,
    required super.pledgerName,
    required super.done,
  });

  factory PledgeModel.fromJson({required Map<String, dynamic> json}) {
    return PledgeModel(
      id: json['id'],
      description: json['description'],
      pledgerName: json['done'],
      done: json['done'],
      challengeId: json['challengeId'],
    );
  }
}
