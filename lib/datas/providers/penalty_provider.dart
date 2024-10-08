import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/constants/app_constants.dart';
import '../models/penalty_model.dart';

class PenaltyProvider {
  Future<List<Penalty>> getAllPenalties() async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}${AppConstants.penaltiesEndpoint}'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((penalty) => Penalty.fromJson(penalty)).toList();
    } else {
      throw Exception('Failed to load penalties');
    }
  }

  Future<Penalty> getPenaltyById(int id) async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}${AppConstants.penaltiesEndpoint}/$id'));

    if (response.statusCode == 200) {
      return Penalty.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load penalty');
    }
  }

  Future<void> createPenalty(Map<String, dynamic> penaltyData) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}${AppConstants.penaltiesEndpoint}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(penaltyData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create penalty');
    }
  }

  Future<void> updatePenalty(int id, Map<String, dynamic> penaltyData) async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}${AppConstants.penaltiesEndpoint}/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(penaltyData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update penalty');
    }
  }

  Future<void> deletePenalty(int id) async {
    final response = await http.delete(
      Uri.parse('${AppConstants.baseUrl}${AppConstants.penaltiesEndpoint}/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete penalty');
    }
  }
}
