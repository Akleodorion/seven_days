import 'package:equatable/equatable.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

class UpdateChallengeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Unloaded extends UpdateChallengeState {}

class Loading extends UpdateChallengeState {}

class Loaded extends UpdateChallengeState {
  final Challenge challenge;

  Loaded({
    required this.challenge,
  });

  Loaded copyWith({required Challenge? challenge}) {
    return Loaded(challenge: challenge ?? this.challenge);
  }

  @override
  List<Object?> get props => [
        challenge,
      ];
}

class Error extends UpdateChallengeState {
  final List<Challenge>? challenge;
  final String errorMessage;

  Error({
    required this.challenge,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [challenge, errorMessage];
}
