import 'package:equatable/equatable.dart';

class DestroyChallengeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Unloaded extends DestroyChallengeState {}

class Loading extends DestroyChallengeState {}

class Loaded extends DestroyChallengeState {
  Loaded();

  @override
  List<Object?> get props => [];
}

class Error extends DestroyChallengeState {
  final String errorMessage;

  Error({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}
