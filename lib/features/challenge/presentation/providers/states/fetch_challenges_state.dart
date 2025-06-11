import 'package:equatable/equatable.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

class FetchChallengesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Unloaded extends FetchChallengesState {}

class Loading extends FetchChallengesState {}

class Loaded extends FetchChallengesState {
  final List<Challenge> challenges;

  Loaded({
    required this.challenges,
  });

  Loaded copyWith({required List<Challenge>? challenges}) {
    return Loaded(challenges: challenges ?? this.challenges);
  }

  @override
  List<Object?> get props => [
        challenges,
      ];
}

class Error extends FetchChallengesState {
  final List<Challenge>? challenges;
  final String errorMessage;

  Error({
    required this.challenges,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [challenges, errorMessage];
}
