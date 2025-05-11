import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seven_days/core/errors/exceptions.dart';
import 'package:seven_days/features/game/data/model/game_model.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

abstract class GameRemoteDateSource {
  Future<Game> createGame({required List<Player> players});
  Future<Game> updateGame({required int gameId});
  Future<Game?> activeGame();
}

class GameRemoteDateSourceImpl implements GameRemoteDateSource {
  @override
  Future<Game?> activeGame() async {
    final Uri url = Uri.parse('Url');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return GameModel.fromJson(json: jsonData);
    }

    throw ServerException(
      errorMessage: 'Server unreachable',
    );
  }

  @override
  Future<Game> createGame({required List<Player> players}) {
    // TODO: implement createGame
    throw UnimplementedError();
  }

  @override
  Future<Game> updateGame({required int gameId}) {
    // TODO: implement updateGame
    throw UnimplementedError();
  }
}
