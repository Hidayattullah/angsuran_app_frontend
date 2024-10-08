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
  final InstallmentRepository _repository;

  GetInstallmentById(this._repository);

  Future<Installment> call(int id) async {
    return await _repository.getInstallment(id);
  }
}
