import 'package:equatable/equatable.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

class CurrentPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loaded extends CurrentPlayerState {
  final Player player;

  Loaded({required this.player});

  Loaded copyWith({required Player? player}) {
    return Loaded(player: player ?? this.player);
  }

  @override
  List<Object?> get props => [player];
}

class Loading extends CurrentPlayerState {}

class Error extends CurrentPlayerState {
  final String message;
  final Player? player;

  Error({required this.message, required this.player});

  @override
  List<Object?> get props => [
        message,
        player,
      ];
}
