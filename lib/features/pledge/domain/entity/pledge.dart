import 'package:equatable/equatable.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

class Pledge extends Equatable {
  final String description;
  final String pledgerName;
  final bool done;
  final int challengeId;

  const Pledge(this.challengeId,
      {required this.description,
      required this.pledgerName,
      required this.done});
  @override
  List<Object?> get props => throw UnimplementedError();
}
