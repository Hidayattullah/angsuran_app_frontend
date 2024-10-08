// lib/domain/usecases/penalty/get_penalty.dart
import '../../../datas/models/penalty_model.dart';
import '../../../datas/repositories/penalty_repository.dart';

class GetPenalties {
  final PenaltyRepository _repository;

  GetPenalties(this._repository);

  Future<List<Penalty>> call() async {
    return await _repository.getPenalties();
  }
}

class GetPenaltyById {
  final PenaltyRepository _repository;

  GetPenaltyById(this._repository);

  Future<Penalty> call(int id) async {
    return await _repository.getPenalty(id);
  }
}
