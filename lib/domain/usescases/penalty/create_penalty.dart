// lib/domain/usecases/penalty/create_penalty.dart
import '../../../datas/models/penalty_model.dart';
import '../../../datas/repositories/penalty_repository.dart';

class CreatePenalty {
  final PenaltyRepository _repository;

  CreatePenalty(this._repository);

  Future<void> call(Penalty penalty) async {
    await _repository.createPenalty(penalty);
  }
}
