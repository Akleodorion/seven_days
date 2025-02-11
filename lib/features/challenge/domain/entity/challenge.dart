import 'package:equatable/equatable.dart';

class Challenge extends Equatable {
  final String description;
  final bool proposed;
  final bool done;

  const Challenge({required this.description, required this.proposed, required this.done});

  @override
  List<Object?> get props => [description, proposed, done];

}
