// lib/data/models/penalty_model.dart

import 'installment_model.dart';

class Penalty {
  final int id;
  final double penaltyAmount;
  final String penaltyReason;
  final Installment? installment; // Bisa nullable karena mungkin installment null pada update
  final DateTime? penaltyDate; // Tambahkan untuk menyimpan tanggal penalti
  final DateTime? createdAt; // Untuk menyimpan tanggal dibuat
  final DateTime? updatedAt; // Untuk menyimpan tanggal diperbarui

  Penalty({
    required this.id,
    required this.penaltyAmount,
    required this.penaltyReason,
    this.installment, // installment bisa null
    this.penaltyDate, // Tanggal penalti bisa null
    this.createdAt, // Tanggal dibuat bisa null
    this.updatedAt, // Tanggal diperbarui bisa null
  });

  // Factory method to parse JSON data
  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
      id: json['id'],
      penaltyAmount: json['penaltyAmount'],
      penaltyReason: json['penaltyReason'],
      // Handling nullable installment
      installment: json['installment'] != null ? Installment.fromJson(json['installment']) : null,
      penaltyDate: json['penaltyDate'] != null ? DateTime.parse(json['penaltyDate']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
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
