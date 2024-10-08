// lib/data/repositories/contract_repository.dart

import '../models/contract_model.dart';
import '../providers/contract_provider.dart';

class ContractRepository {
  final ContractProvider _contractProvider = ContractProvider();

  Future<List<Contract>> getContracts() {
    return _contractProvider.getAllContracts();
  }

  Future<Contract> getContract(int id) {
    return _contractProvider.getContractById(id);
  }

  Future<Contract> createContract(Contract contract) {
    return _contractProvider.createContract(contract);
  }

  Future<Contract> updateContract(int id, Contract contract) {
    return _contractProvider.updateContract(id, contract);
  }
}
