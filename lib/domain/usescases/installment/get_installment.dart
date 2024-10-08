// lib/domain/usecases/installment/get_installments.dart

import '../../../datas/models/installment_model.dart';
import '../../../datas/repositories/installment_repository.dart';

class GetInstallments {
  final InstallmentRepository _repository;

  GetInstallments(this._repository);

  Future<List<Installment>> call() async {
    return await _repository.getInstallments();
  }
}

class GetInstallmentById {
  final InstallmentRepository _installmentRepository;

  GetInstallmentById(this._installmentRepository);

  Future<Installment> call(int id) {
    return _installmentRepository.getInstallment(id); // Call the repository method
  }
}
