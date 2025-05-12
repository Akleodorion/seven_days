import 'package:equatable/equatable.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';

class CreateGameState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Unloaded extends CreateGameState {}

class Loaded extends CreateGameState {
  final Game game;

  Loaded({required this.game});

  Loaded copyWith({required Game? game}) {
    return Loaded(game: game ?? this.game);
  }
}

class Loading extends CreateGameState {}

class Error extends CreateGameState {
  final String errorMessage;
  final Game? game;

  Error({required this.errorMessage, required this.game});
}
