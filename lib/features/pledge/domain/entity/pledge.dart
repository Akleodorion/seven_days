import 'package:equatable/equatable.dart';

class Pledge extends Equatable {
  final int id;
  final String description;
  final String pledgerName;
  final bool done;
  final int? challengeId;

  const Pledge({
    required this.id,
    required this.challengeId,
    required this.description,
    required this.pledgerName,
    required this.done,
  });
  @override
  List<Object?> get props => [
        id,
        description,
        pledgerName,
        done,
        challengeId,
      ];
}
