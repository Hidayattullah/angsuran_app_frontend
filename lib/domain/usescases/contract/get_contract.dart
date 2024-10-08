// lib/domain/usecases/contract/get_contract.dart
import '../../../datas/models/contract_model.dart';
import '../../../datas/repositories/contract_repository.dart';

class GetContracts {
  final ContractRepository _repository;

  GetContracts(this._repository);

  Future<List<Contract>> call() async {
    return await _repository.getContracts();
  }
}

class GetContractById {
  final ContractRepository _repository;

  GetContractById(this._repository);

  Future<Contract> call(int id) async {
    return await _repository.getContract(id);
  }
}
