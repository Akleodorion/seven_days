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
      final Map<String, dynamic>? jsonData = json.decode(response.body);

      return jsonData == null ? null : GameModel.fromJson(json: jsonData!);
    }

    throw ServerException(
      errorMessage: 'Server unreachable',
    );
  }

  @override
  Future<Game> createGame({required List<Player> players}) async {
    final Uri url = Uri.parse('url');
    final http.Response response = await http.post(
      url,
      body: json.encode(players),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 201) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return GameModel.fromJson(json: jsonData);
    }

    throw ServerException(
      errorMessage: 'Server Unreachable',
    );
  }

  @override
  Future<Game> updateGame({required int gameId}) async {
    final Uri url = Uri.parse('url');
    final http.Response response = await http.patch(
      url,
      body: json.encode(gameId),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return GameModel.fromJson(json: jsonData);
    }

    throw ServerException(
      errorMessage: 'Server Unreachable',
    );
  }
}
