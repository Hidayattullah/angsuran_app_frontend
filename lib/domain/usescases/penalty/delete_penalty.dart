// lib/domain/usecases/penalty/delete_penalty.dart
import '../../../datas/repositories/penalty_repository.dart';

class DeletePenalty {
  final PenaltyRepository _repository;

  DeletePenalty(this._repository);

  Future<void> call(int id) async {
    await _repository.deletePenalty(id);
  }
}
