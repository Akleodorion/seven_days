import 'package:seven_days/features/player/domain/entity/player.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required super.id,
    required super.name,
  });

  factory PlayerModel.fromJson({required Map<String, dynamic> json}) {
    return PlayerModel(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
