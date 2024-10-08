// lib/domain/usecases/penalty/update_penalty.dart
import '../../../datas/models/penalty_model.dart';
import '../../../datas/repositories/penalty_repository.dart';

class UpdatePenalty {
  final PenaltyRepository _repository;

  UpdatePenalty(this._repository);

  Future<void> call(Penalty penalty) async {
    await _repository.updatePenalty(penalty);
  }
}
