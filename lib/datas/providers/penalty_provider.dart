import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/constants/app_constants.dart';
import '../models/penalty_model.dart';

class PenaltyProvider {
  // Get all penalties
  Future<List<Penalty>> getAllPenalties() async {
  try {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}${AppConstants.penaltiesEndpoint}'),
    );

    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
    }
    if (kDebugMode) {
      print('Response body: ${response.body}');
    } // Log the full response body

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Ensure the response contains the penalties key
      if (data is Map && data['penalties'] is List) {
        return (data['penalties'] as List)
            .map((penalty) => Penalty.fromJson(penalty))
            .toList();
      } else {
        if (kDebugMode) {
          print('Unexpected response structure: $data');
        }
        throw Exception('Expected a list of penalties but received an unexpected structure');
      }
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode} - ${response.body}');
      } // Log error details
      throw Exception('Failed to load penalties');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching penalties: $e');
    } // Log any exception that occurs
    throw Exception('Failed to load penalties');
  }
}


  // Get a specific penalty by ID
  Future<Penalty> getPenaltyById(int id) async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}${AppConstants.penaltiesEndpoint}/$id')
    );

    if (response.statusCode == 200) {
      return Penalty.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load penalty');
    }
  }

  // Create a new penalty
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

  // Update an existing penalty by ID
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

  // Delete a penalty by ID
  Future<void> deletePenalty(int id) async {
    final response = await http.delete(
      Uri.parse('${AppConstants.baseUrl}${AppConstants.penaltiesEndpoint}/$id')
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete penalty');
    }
  }
}
