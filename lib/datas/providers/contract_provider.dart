import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/constants/app_constants.dart';
import '../models/contract_model.dart';

class ContractProvider {
   // Fetch all contracts
  Future<List<Contract>> getAllContracts() async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/contracts'));

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);

      // Extract contracts from the JSON object
      List contracts = decodedData['contracts'];

      // Map the contracts to Contract model
      return contracts.map((contract) => Contract.fromJson(contract)).toList();
    } else {
      throw Exception('Failed to load contracts');
    }
  }

  // Fetch a contract by ID
  Future<Contract> getContractById(int id) async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/contracts/$id'));

    if (response.statusCode == 200) {
      return Contract.fromJson(json.decode(response.body));
    } else {
      if (kDebugMode) {
        print('Failed to load contract: ${response.body}');
      }
      throw Exception('Failed to load contract');
    }
  }

  // Create a new contract
  Future<Contract> createContract(Contract contract) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/contracts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'contractNumber': contract.contractNumber,
        'clientName': contract.clientName,
        'otr': contract.otr,
        'downPayment': contract.downPayment,
        'principalDebt': contract.principalDebt,
        'interestRate': contract.interestRate,
        'monthlyInstallment': contract.monthlyInstallment,
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

  // Update an existing contract
  Future<Contract> updateContract(int id, Contract contract) async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}/contracts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'contractNumber': contract.contractNumber,
        'clientName': contract.clientName,
        'otr': contract.otr,
        'downPayment': contract.downPayment,
        'principalDebt': contract.principalDebt,
        'interestRate': contract.interestRate,
        'monthlyInstallment': contract.monthlyInstallment,
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

  // Delete a contract by ID
  Future<void> deleteContract(int id) async {
    final response = await http.delete(Uri.parse('${AppConstants.baseUrl}/contracts/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete contract');
    }
  }
}
