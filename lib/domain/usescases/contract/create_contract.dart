// lib/domain/usecases/contract/create_contract.dart
import '../../../datas/models/contract_model.dart';
import '../../../datas/repositories/contract_repository.dart';

class CreateContract {
  final ContractRepository _repository;

  CreateContract(this._repository);

  Future<void> call(Contract contract) async {
    await _repository.createContract(contract);
  }
}
