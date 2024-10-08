// lib/data/models/contract_model.dart

class Contract {
  final int id;
  final String contractNumber;
  final String clientName;
  final double contractValue; // OTR
  final double downPayment;
  final int durationInMonths;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Contract({
    required this.id,
    required this.contractNumber,
    required this.clientName,
    required this.contractValue,
    required this.downPayment,
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
      contractValue: json['otr'],
      downPayment: json['downPayment'],
      durationInMonths: json['durationInMonths'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
