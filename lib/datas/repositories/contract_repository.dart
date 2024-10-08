// lib/data/repositories/contract_repository.dart

import '../models/contract_model.dart';
import '../providers/contract_provider.dart';

class ContractRepository {
  final ContractProvider _contractProvider = ContractProvider();

  // Get all contracts
  Future<List<Contract>> getContracts() {
    return _contractProvider.getAllContracts();
  }

  // Get a single contract by ID
  Future<Contract> getContract(int id) {
    return _contractProvider.getContractById(id);
  }

  // Create a new contract
  Future<Contract> createContract(Contract contract) {
    return _contractProvider.createContract(contract);
  }

  // Update an existing contract
  Future<Contract> updateContract(int id, Contract contract) {
    return _contractProvider.updateContract(id, contract);
  }

  // Delete a contract by ID
  Future<void> deleteContract(int id) {
    return _contractProvider.deleteContract(id);
  }
}
