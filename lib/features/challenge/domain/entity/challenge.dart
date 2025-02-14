import 'package:equatable/equatable.dart';

class Challenge extends Equatable {
  final int id;
  final String description;
  final bool proposed;
  final bool done;

  const Challenge(
      {required this.id,
      required this.description,
      required this.proposed,
      required this.done});

  @override
  List<Object?> get props => [id, description, proposed, done];
}
