import 'package:equatable/equatable.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class FetchPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loaded extends FetchPlayerState {
  final List<Player> players;

  Loaded({required this.players});

  Loaded copyWith({required List<Player>? players}) {
    return Loaded(players: players ?? this.players);
  }

  @override
  List<Object?> get props => [players];
}

class Loading extends FetchPlayerState {}

class Error extends FetchPlayerState {
  final String message;
  final List<Player>? players;

  Error({required this.message, required this.players});

  @override
  List<Object?> get props => [
        message,
        players,
      ];
}
