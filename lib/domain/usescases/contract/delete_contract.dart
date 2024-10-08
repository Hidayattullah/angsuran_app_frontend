// lib/domain/usecases/contract/delete_contract.dart
import '../../../datas/repositories/contract_repository.dart';

class DeleteContract {
  final ContractRepository _repository;

  DeleteContract(this._repository);

  Future<void> call(int id) async {
    await _repository.deleteContract(id);
  }
}
