import 'dart:convert';
import 'package:seven_days/core/errors/exceptions.dart';
import 'package:seven_days/features/challenge/data/model/challenge_model.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:http/http.dart' as http;

abstract class ChallengeRemoteDataSource {
  Future<List<Challenge>> fetchChallenges();
  Future<Challenge> updateChallenge({required Challenge challenge});
  Future<Challenge> createChallenge({required Challenge challenge});
}

class ChallengeRemoteDataSourceImpl implements ChallengeRemoteDataSource {
  @override
  Future<List<Challenge>> fetchChallenges() async {
    final Uri url = Uri.parse('String');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      final List<Challenge> challenges = jsonData['challenges']
          .map<Challenge>((json) => ChallengeModel.fromJson(json: json))
          .toList();

      return challenges;
    }

    throw ServerException(
      errorMessage: "Mauvais requête serveur, veuillez ré-essayer plus tard",
    );
  }

  @override
  Future<Challenge> createChallenge({required Challenge challenge}) async {
    final Uri url = Uri.parse('http://localhost:3000/api/v1/challenges');
    final response = await http.post(url,
        body: json.encode(
          challenge.toJson(),
        ),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return ChallengeModel.fromJson(json: jsonData['challenge']);
    }

    throw ServerException(
      errorMessage: "Mauvais requête serveur, veuillez ré-essayer plus tard",
    );
  }

  @override
  Future<Challenge> updateChallenge({required Challenge challenge}) async {
    final Uri url =
        Uri.parse('http://localhost:3000/api/v1/challenges/${challenge.id}');
    final response = await http.patch(
      url,
      body: json.encode(
        challenge.toJson(),
      ),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return ChallengeModel.fromJson(json: jsonData['challenge']);
    }

    throw ServerException(
      errorMessage: "Mauvais requête serveur, veuillez ré-essayer plus tard",
    );
  }
}
