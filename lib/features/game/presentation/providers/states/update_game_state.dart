import 'package:equatable/equatable.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';

class UpdateGameState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Unloaded extends UpdateGameState {}

class Loaded extends UpdateGameState {
  final Game game;

  Loaded({required this.game});

  Loaded copyWith({required Game? game}) {
    return Loaded(game: game ?? this.game);
  }

  @override
  List<Object?> get props => [game];
}

class Loading extends UpdateGameState {}

class Error extends UpdateGameState {
  final String errorMessage;
  final Game? game;

  Error({required this.errorMessage, required this.game});

  @override
  List<Object?> get props => [errorMessage, game];
}
