// lib/domain/usecases/contract/update_contract.dart
import '../../../datas/models/contract_model.dart';
import '../../../datas/repositories/contract_repository.dart';

class UpdateContract {
  final ContractRepository _repository;

  UpdateContract(this._repository);

  Future<void> call(int id, Contract contract) async {
    await _repository.updateContract(id, contract);
  }
}
