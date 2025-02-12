import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

class ChallengeModel extends Challenge {
  const ChallengeModel({
    required super.description,
    required super.done,
    required super.proposed,
  });

  factory ChallengeModel.fromJson({required Map<String, dynamic> json}) {
    return ChallengeModel(
      description: json['description'],
      done: json['done'],
      proposed: json['proposed'],
    );
  }
}
