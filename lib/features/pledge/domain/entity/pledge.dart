import 'package:equatable/equatable.dart';
import 'package:seven_days/core/enums/pledge_status.dart';

class Pledge extends Equatable {
  final int id;
  final int targetId;
  final int playerId;
  final String description;
  final PledgeStatus status;
  final int? gameId;

  const Pledge({
    required this.id,
    required this.targetId,
    required this.playerId,
    required this.description,
    required this.status,
    required this.gameId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'target_id': targetId,
      'player_id': playerId,
      'description': description,
      'status': status.string,
      'game_id': gameId
    };
  }

  @override
  List<Object?> get props => [
        id,
        targetId,
        playerId,
        description,
        status,
        gameId,
      ];
}
