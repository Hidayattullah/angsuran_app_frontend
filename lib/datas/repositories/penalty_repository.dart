import '../models/penalty_model.dart';
import '../providers/penalty_provider.dart';

class PenaltyRepository {
  final PenaltyProvider _penaltyProvider = PenaltyProvider();

  Future<List<Penalty>> getPenalties() {
    return _penaltyProvider.getAllPenalties();
  }

  Future<Penalty> getPenalty(int id) {
    return _penaltyProvider.getPenaltyById(id);
  }

  // check jika installment tidak null sebelum dimasukan ke data map
  Future<void> createPenalty(Penalty penalty) {
    final data = {
      if (penalty.installment != null) 'installmentId': penalty.installment!.id,
      'penaltyAmount': penalty.penaltyAmount,
      'penaltyReason': penalty.penaltyReason,
    };
    return _penaltyProvider.createPenalty(data);
  }

  // check jika installment tidak null sebelum dimasukan ke data map
  Future<void> updatePenalty(Penalty penalty) {
    final data = {
      if (penalty.installment != null) 'installmentId': penalty.installment!.id,
      'penaltyAmount': penalty.penaltyAmount,
      'penaltyReason': penalty.penaltyReason,
    };
    return _penaltyProvider.updatePenalty(penalty.id, data);
  }

  Future<void> deletePenalty(int id) {
    return _penaltyProvider.deletePenalty(id);
  }
}
