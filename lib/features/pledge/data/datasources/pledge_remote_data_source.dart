import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seven_days/core/errors/exceptions.dart';
import 'package:seven_days/features/pledge/data/model/pledge_model.dart';
import 'package:seven_days/features/pledge/domain/entity/pledge.dart';

abstract class PledgeRemoteDataSource {
  Future<List<Pledge>> fetchPledges();
  Future<Pledge> createPledge();
  Future<Pledge> updatePledge();
}

class PledgeRemoteDataSourceImpl implements PledgeRemoteDataSource {
  @override
  Future<List<Pledge>> fetchPledges() async {
    final Uri uri = Uri.parse('url');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<Pledge> pledges = jsonData['pledges']
          .map<Pledge>((json) => PledgeModel.fromJson(json: json))
          .toList();
      return pledges;
    }
    throw ServerException(errorMessage: 'oops');
  }

  @override
  Future<Pledge> createPledge() async {
    final Uri uri = Uri.parse('url');

    final response = await http.get(uri);

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return PledgeModel.fromJson(json: jsonData);
    }

    throw ServerException(errorMessage: 'oops');
  }

  @override
  Future<Pledge> updatePledge() async {
    final Uri uri = Uri.parse('url');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return PledgeModel.fromJson(json: jsonData);
    }

    throw ServerException(errorMessage: 'oops');
  }
}
