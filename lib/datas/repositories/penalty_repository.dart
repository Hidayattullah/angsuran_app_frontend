import '../models/penalty_model.dart';
import '../providers/penalty_provider.dart';

class PenaltyRepository {
  final PenaltyProvider _penaltyProvider = PenaltyProvider();

  // Mengambil semua penalti
  Future<List<Penalty>> getPenalties() {
    return _penaltyProvider.getAllPenalties();
  }

  // Mengambil penalti berdasarkan ID
  Future<Penalty> getPenalty(int id) {
    return _penaltyProvider.getPenaltyById(id);
  }

  // Membuat penalti baru, dengan pengecekan jika installment tidak null
  Future<void> createPenalty(Penalty penalty) {
    final data = {
      if (penalty.installment != null) 'installmentId': penalty.installment!.id,
      'penaltyAmount': penalty.penaltyAmount,
      'penaltyReason': penalty.penaltyReason,
      'penaltyDate': penalty.penaltyDate?.toIso8601String(),
    };
    return _penaltyProvider.createPenalty(data);
  }

  // Memperbarui penalti, dengan pengecekan jika installment tidak null
  Future<void> updatePenalty(Penalty penalty) {
    final data = {
      if (penalty.installment != null) 'installmentId': penalty.installment!.id,
      'penaltyAmount': penalty.penaltyAmount,
      'penaltyReason': penalty.penaltyReason,
      'penaltyDate': penalty.penaltyDate?.toIso8601String(),
    };
    return _penaltyProvider.updatePenalty(penalty.id, data);
  }

  // Menghapus penalti berdasarkan ID
  Future<void> deletePenalty(int id) {
    return _penaltyProvider.deletePenalty(id);
  }
}
