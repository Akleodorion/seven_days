import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String name;
  final int id;

  const Player({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
