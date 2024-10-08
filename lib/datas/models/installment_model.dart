// lib/data/models/installment_model.dart

class Installment {
  final int id;
  final int installmentNo;
  final double amountPerMonth;
  final DateTime dueDate;
  final dynamic contract; // Bisa nullable atau jenis lain (ubah sesuai kontrak)

  Installment({
    required this.id,
    required this.installmentNo,
    required this.amountPerMonth,
    required this.dueDate,
    this.contract, 
  });

  // Factory method to parse JSON data
  factory Installment.fromJson(Map<String, dynamic> json) {
    return Installment(
      id: json['id'],
      installmentNo: json['installmentNo'],
      amountPerMonth: json['amountPerMonth'],
      dueDate: DateTime.parse(json['dueDate']),
      contract: json['contract'], 
    );
  }
}
