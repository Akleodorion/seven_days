import 'package:equatable/equatable.dart';
import 'package:seven_days/core/enums/game_status.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';

class Game extends Equatable {
  final int id;
  final GameStatus gameStatus;
  final Player? stoppedBy;
  final Challenge challenge;
  final List<Player> players;
  final List<Player> loosers;
  final List<Player> winners;
  final List<Pledge> pledges;
  final DateTime endDate;

  const Game(
      {required this.id,
      required this.stoppedBy,
      required this.gameStatus,
      required this.challenge,
      required this.players,
      required this.loosers,
      required this.winners,
      required this.pledges,
      required this.endDate});

  Game copyWith({
    int? id,
    Player? stoppedBy,
    GameStatus? gameStatus,
    Challenge? challenge,
    List<Player>? players,
    List<Player>? winners,
    List<Player>? loosers,
    List<Pledge>? pledges,
    DateTime? endDate,
  }) {
    return Game(
      id: id ?? this.id,
      stoppedBy: stoppedBy ?? this.stoppedBy,
      gameStatus: gameStatus ?? this.gameStatus,
      challenge: challenge ?? this.challenge,
      players: players ?? this.players,
      winners: winners ?? this.winners,
      loosers: loosers ?? this.loosers,
      pledges: pledges ?? this.pledges,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'stopped_by': stoppedBy?.toJson(),
      'status': gameStatus.string,
      'challenge': challenge.toJson(),
      'players': players.map((e) => e.toJson()).toList(),
      'winners': winners.map((e) => e.toJson()).toList(),
      'loosers': loosers.map((e) => e.toJson()).toList(),
      'pledges': pledges.map((e) => e.toJson()).toList(),
      'end_date': endDate.toString()
    };
  }

  @override
  List<Object?> get props => [
        id,
        stoppedBy,
        gameStatus,
        challenge,
        players,
        winners,
        loosers,
        pledges,
        endDate,
      ];

  String get endedBy {
    return stoppedBy?.name ?? 'Chrono';
  }
}
