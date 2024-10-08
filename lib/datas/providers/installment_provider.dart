// lib/data/providers/installment_provider.dart

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/constants/app_constants.dart';
import '../models/installment_model.dart';

class InstallmentProvider {
  Future<List<Installment>> getAllInstallments() async {
  try {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/installments'));

    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
    }
    if (kDebugMode) {
      print('Response body: ${response.body}');
    } // Log the full response body

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      // Ensure the response contains the installments key
      if (data is Map && data['installments'] is List) {
        return (data['installments'] as List)
            .map((installment) => Installment.fromJson(installment))
            .toList();
      } else {
        if (kDebugMode) {
          print('Unexpected response structure: $data');
        }
        throw Exception('Expected a list of installments but received an unexpected structure');
      }
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode} - ${response.body}');
      } // Log error details
      throw Exception('Failed to load installments');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching installments: $e');
    } // Log any exception that occurs
    throw Exception('Failed to load installments');
  }
}


  Future<Installment> getInstallmentById(int id) async {
    try {
      final response = await http.get(Uri.parse('${AppConstants.baseUrl}/installments/$id'));

      if (response.statusCode == 200) {
        return Installment.fromJson(json.decode(response.body)['installment']);
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode} - ${response.body}');
        } // Log error details
        throw Exception('Failed to load installment');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching installment with ID $id: $e');
      } // Log any exception that occurs
      throw Exception('Failed to load installment');
    }
  }

  // Fungsi untuk membuat installment
  Future<Installment> createInstallment(Installment installment) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/installments'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'installmentNo': installment.installmentNo,
        'amountPerMonth': installment.amountPerMonth,
        'interestRate': installment.interestRate,
        'principalAmount': installment.principalAmount,
        'dueDate': installment.dueDate.toIso8601String(),
        'status': installment.status,
        'isPaidOff': installment.isPaidOff,
        // Jika Anda ingin mengirimkan data kontrak juga, tambahkan di sini
        // 'contract': installment.contract != null ? installment.contract.toJson() : null,
      }),
    );

    if (response.statusCode == 201) {
      return Installment.fromJson(json.decode(response.body)['installment']);
    } else {
      throw Exception('Failed to create installment');
    }
  }

  // Fungsi untuk memperbarui installment
  Future<Installment> updateInstallment(int id, Installment installment) async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}/installments/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'installmentNo': installment.installmentNo,
        'amountPerMonth': installment.amountPerMonth,
        'interestRate': installment.interestRate,
        'principalAmount': installment.principalAmount,
        'dueDate': installment.dueDate.toIso8601String(),
        'status': installment.status,
        'isPaidOff': installment.isPaidOff,
        // Jika Anda ingin mengirimkan data kontrak juga, tambahkan di sini
        // 'contract': installment.contract != null ? installment.contract.toJson() : null,
      }),
    );

    if (response.statusCode == 200) {
      return Installment.fromJson(json.decode(response.body)['installment']);
    } else {
      throw Exception('Failed to update installment');
    }
  }

  // Fungsi untuk menghapus installment
  Future<void> deleteInstallment(int id) async {
    final response = await http.delete(Uri.parse('${AppConstants.baseUrl}/installments/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete installment');
    }
  }
}
