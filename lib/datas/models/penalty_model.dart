// lib/data/models/penalty_model.dart

import 'installment_model.dart';

class Penalty {
  final int id;
  final double penaltyAmount;
  final String penaltyReason;
  final Installment? installment; // Bisa nullable karena mungkin installment null pada update

  Penalty({
    required this.id,
    required this.penaltyAmount,
    required this.penaltyReason,
    this.installment, // installment bisa null
  });

  // Factory method to parse JSON data
  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
      id: json['id'],
      penaltyAmount: json['penaltyAmount'],
      penaltyReason: json['penaltyReason'],
      // Handling nullable installment
      installment: json['installment'] != null ? Installment.fromJson(json['installment']) : null,
    );
  }
}
