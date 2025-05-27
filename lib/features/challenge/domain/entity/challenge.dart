import 'package:equatable/equatable.dart';
import 'package:seven_days/core/enums/challenge_status.dart';

class Challenge extends Equatable {
  final int id;
  final int playerId;
  final String description;
  final ChallengeStatus status;
  final int? gameId;

  const Challenge({
    required this.id,
    required this.description,
    required this.status,
    required this.playerId,
    required this.gameId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'player_id': playerId,
      'description': description,
      'status': status.string,
      'game_id': gameId
    };
  }

  @override
  List<Object?> get props => [
        id,
        description,
        status,
        playerId,
        gameId,
      ];
}
