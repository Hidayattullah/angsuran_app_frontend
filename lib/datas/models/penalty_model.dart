// lib/data/models/penalty_model.dart

import 'installment_model.dart';

class Penalty {
  final int id;
  final double penaltyAmount;
  final String penaltyReason;
  final Installment? installment; // Nullable
  final DateTime? penaltyDate; // Nullable
  final DateTime? createdAt; // Nullable
  final DateTime? updatedAt; // Nullable

  Penalty({
    required this.id,
    required this.penaltyAmount,
    required this.penaltyReason,
    this.installment,
    this.penaltyDate,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to parse JSON data
  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
      id: json['id'],
      penaltyAmount: _parseDouble(json['penaltyAmount']),
      penaltyReason: json['penaltyReason'] ?? '', // Default to empty string if null
      installment: json['installment'] != null ? Installment.fromJson(json['installment']) : null,
      penaltyDate: json['penaltyDate'] != null ? DateTime.parse(json['penaltyDate']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0; // Return 0.0 if value is null
    if (value is String) return double.tryParse(value) ?? 0.0; // Try to parse string to double
    return value.toDouble(); // If already double, return it
  }

  // Method to convert Penalty object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'penaltyAmount': penaltyAmount,
      'penaltyReason': penaltyReason,
      'penaltyDate': penaltyDate?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
