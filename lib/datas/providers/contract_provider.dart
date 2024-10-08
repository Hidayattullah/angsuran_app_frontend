// lib/data/providers/contract_provider.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/constants/app_constants.dart';
import '../models/contract_model.dart';

class ContractProvider {
  Future<List<Contract>> getAllContracts() async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/contracts'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((contract) => Contract.fromJson(contract)).toList();
    } else {
      throw Exception('Failed to load contracts');
    }
  }

  Future<Contract> getContractById(int id) async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/contracts/$id'));

    if (response.statusCode == 200) {
      return Contract.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load contract');
    }
  }

  Future<Contract> createContract(Contract contract) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/contracts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'contractNumber': contract.contractNumber,
        'clientName': contract.clientName,
        'otr': contract.contractValue,
        'downPayment': contract.downPayment,
        'durationInMonths': contract.durationInMonths,
        'startDate': contract.startDate.toIso8601String(),
        'endDate': contract.endDate.toIso8601String(),
      }),
    );

    if (response.statusCode == 201) {
      return Contract.fromJson(json.decode(response.body)['contract']);
    } else {
      throw Exception('Failed to create contract');
    }
  }

  Future<Contract> updateContract(int id, Contract contract) async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}/contracts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'contractNumber': contract.contractNumber,
        'clientName': contract.clientName,
        'otr': contract.contractValue,
        'downPayment': contract.downPayment,
        'durationInMonths': contract.durationInMonths,
        'startDate': contract.startDate.toIso8601String(),
        'endDate': contract.endDate.toIso8601String(),
      }),
    );

    if (response.statusCode == 200) {
      return Contract.fromJson(json.decode(response.body)['contract']);
    } else {
      throw Exception('Failed to update contract');
    }
  }
}
