import 'package:equatable/equatable.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';

class Player extends Equatable {
  final int id;
  final String name;
  final List<Challenge> challenges;
  final List<Pledge> pledges;
  final List<Pledge> targetPledge;

  const Player({
    required this.id,
    required this.name,
    required this.challenges,
    required this.pledges,
    required this.targetPledge,
  });

  Player copyWith({
    int? id,
    String? name,
    List<Challenge>? challenges,
    List<Pledge>? pledges,
    List<Pledge>? targetPledge,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      challenges: challenges ?? this.challenges,
      pledges: pledges ?? this.pledges,
      targetPledge: targetPledge ?? this.targetPledge,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        challenges,
        pledges,
        targetPledge,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'challenges': challenges.map((e) => e.toJson()).toList(),
      'pledges': pledges.map((e) => e.toJson()).toList(),
      'targetPledge': targetPledge.map((e) => e.toJson()).toList(),
    };
  }
}
