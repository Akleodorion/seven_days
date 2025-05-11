import 'package:equatable/equatable.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

class Game extends Equatable {
  final GameStatus gameStatus;
  final Challenge challenge;
  final List<Player> players;
  final List<Pledge> pledges;

  const Game({
    required this.gameStatus,
    required this.challenge,
    required this.players,
    required this.pledges,
  });

  @override
  List<Object?> get props => [];
}
