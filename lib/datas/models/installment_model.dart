// lib/data/models/installment_model.dart

import 'contract_model.dart';

class Installment {
  final int id;
  final int installmentNo;
  final double amountPerMonth;
  final double interestRate;
  final double principalAmount;
  final DateTime dueDate;
  final String status;
  final bool isPaidOff;
  final Contract? contract;

  Installment({
    required this.id,
    required this.installmentNo,
    required this.amountPerMonth,
    required this.interestRate,
    required this.principalAmount,
    required this.dueDate,
    required this.status,
    required this.isPaidOff,
    this.contract,
  });

  // Factory method for parsing JSON
  factory Installment.fromJson(Map<String, dynamic> json) {
    return Installment(
      id: json['id'],
      installmentNo: json['installmentNo'],
      amountPerMonth: _parseDouble(json['amountPerMonth']),
      interestRate: _parseDouble(json['interestRate']),
      principalAmount: _parseDouble(json['principalAmount']),
      dueDate: DateTime.parse(json['dueDate']),
      status: json['status'] ?? '', // Default to empty string if null
      isPaidOff: json['isPaidOff'] ?? false, // Default to false if null
      contract: json['contract'] != null ? Contract.fromJson(json['contract']) : null,
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0; // Return 0.0 if value is null
    if (value is String) return double.tryParse(value) ?? 0.0; // Try to parse string to double
    return value.toDouble(); // If already double, return it
  }
}
