import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seven_days/core/errors/exceptions.dart';
import 'package:seven_days/features/game/data/model/game_model.dart';
import 'package:seven_days/features/game/domain/entity/game.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';

abstract class GameRemoteDataSource {
  Future<Game> createGame({required List<Player> players});
  Future<Game> updateGame({required Game game});
  Future<Game?> activeGame();
}

class GameRemoteDataSourceImpl implements GameRemoteDataSource {
  @override
  Future<Game?> activeGame() async {
    final Uri url = Uri.parse('http://localhost:3000/api/v1/games/active_game');
    try {
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        return jsonData['game'] == null
            ? null
            : GameModel.fromJson(json: jsonData['game']);
      }

      throw ServerException(
        errorMessage: 'Server unreachable',
      );
    } on http.ClientException catch (failure) {
      throw ServerException(
        errorMessage: failure.message,
      );
    }
  }

  @override
  Future<Game> createGame({required List<Player> players}) async {
    final Uri url = Uri.parse('http://localhost:3000/api/v1/games');
    final response = await http.post(
      url,
      body: json.encode({
        'players': players.map((p) => p.toJson()).toList(),
      }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return GameModel.fromJson(json: jsonData['game']);
    }

    throw ServerException(
      errorMessage: 'Server Unreachable',
    );
  }

  @override
  Future<Game> updateGame({required Game game}) async {
    final Uri url = Uri.parse("http://localhost:3000/api/v1/games/${game.id}");
    final http.Response response = await http.patch(
      url,
      body: json.encode({
        'player_id': 1,
        'game': game.toJson(),
      }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return GameModel.fromJson(json: jsonData['game']);
    }

    throw ServerException(
      errorMessage: 'Server Unreachable',
    );
  }
}
