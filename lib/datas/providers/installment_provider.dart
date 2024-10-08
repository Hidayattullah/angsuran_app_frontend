// lib/data/providers/installment_provider.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/constants/app_constants.dart';
import '../models/installment_model.dart';

class InstallmentProvider {
  Future<List<Installment>> getAllInstallments() async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/installments'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((installment) => Installment.fromJson(installment)).toList();
    } else {
      throw Exception('Failed to load installments');
    }
  }

  Future<Installment> getInstallmentById(int id) async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/installments/$id'));

    if (response.statusCode == 200) {
      return Installment.fromJson(json.decode(response.body)['installment']);
    } else {
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
