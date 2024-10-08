// lib/data/models/contract_model.dart

class Contract {
  final int id;
  final String contractNumber;
  final String clientName;
  final double otr; 
  final double downPayment;
  final double principalDebt;
  final double interestRate;
  final double monthlyInstallment;
  final int durationInMonths;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Contract({
    required this.id,
    required this.contractNumber,
    required this.clientName,
    required this.otr,
    required this.downPayment,
    required this.principalDebt,
    required this.interestRate,
    required this.monthlyInstallment,
    required this.durationInMonths,
    required this.startDate,
    required this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to parse JSON data
  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      contractNumber: json['contractNumber'],
      clientName: json['clientName'],
      otr: json['otr'],
      downPayment: json['downPayment'],
      principalDebt: json['principalDebt'],
      interestRate: json['interestRate'],
      monthlyInstallment: json['monthlyInstallment'],
      durationInMonths: json['durationInMonths'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Method to convert object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'contractNumber': contractNumber,
      'clientName': clientName,
      'otr': otr,
      'downPayment': downPayment,
      'principalDebt': principalDebt,
      'interestRate': interestRate,
      'monthlyInstallment': monthlyInstallment,
      'durationInMonths': durationInMonths,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
