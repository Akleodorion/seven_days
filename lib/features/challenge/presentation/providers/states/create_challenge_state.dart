import 'package:equatable/equatable.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

class CreateChallengeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Unloaded extends CreateChallengeState {}

class Loading extends CreateChallengeState {}

class Loaded extends CreateChallengeState {
  final Challenge challenge;

  Loaded({
    required this.challenge,
  });

  @override
  List<Object?> get props => [
        challenge,
      ];
}

class Error extends CreateChallengeState {
  final Challenge? challenge;
  final String errorMessage;

  Error({
    required this.challenge,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [challenge, errorMessage];
}
