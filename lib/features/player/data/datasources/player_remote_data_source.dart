import 'dart:convert';

import 'package:seven_days/core/errors/exceptions.dart';
import 'package:seven_days/features/player/data/model/player_model.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:http/http.dart' as http;

abstract class PlayerRemoteDataSource {
  Future<List<Player>> fetchPlayer();
  Future<Player> currentPlayer();
}

class PlayerRemoteDataSourceImpl implements PlayerRemoteDataSource {
  @override
  Future<List<Player>> fetchPlayer() async {
    final Uri url = Uri.parse('http://localhost:3000/api/v1/players');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Player> playersData = jsonData['players']
          .map<Player>((json) => PlayerModel.fromJson(json: json))
          .toList();

      return playersData;
    }
    throw ServerException(errorMessage: 'Oops');
  }

  @override
  Future<Player> currentPlayer() async {
    final Map<String, String> params = {
      'name': 'Chris',
    };
    final Uri url =
        Uri.parse('http://localhost:3000/api/v1/players/current_player')
            .replace(
      queryParameters: params,
    );

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Player playerData = PlayerModel.fromJson(json: jsonData['player']);
      return playerData;
    }
    throw ServerException(errorMessage: 'Oops');
  }
}
