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

  // Factory method untuk parsing JSON
  factory Installment.fromJson(Map<String, dynamic> json) {
    return Installment(
      id: json['id'],
      installmentNo: json['installmentNo'],
      amountPerMonth: json['amountPerMonth'].toDouble(),
      interestRate: json['interestRate'].toDouble(),
      principalAmount: json['principalAmount'].toDouble(),
      dueDate: DateTime.parse(json['dueDate']),
      status: json['status'],
      isPaidOff: json['isPaidOff'],
      contract: json['contract'] != null ? Contract.fromJson(json['contract']) : null,
    );
  }
}
