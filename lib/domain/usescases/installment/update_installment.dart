// lib/domain/usecases/installment/update_installment.dart

import '../../../datas/models/installment_model.dart';
import '../../../datas/repositories/installment_repository.dart';

class UpdateInstallment {
  final InstallmentRepository _repository;

  UpdateInstallment(this._repository);

  Future<Installment> call(int id, Installment installment) async {
    return await _repository.updateInstallment(id, installment);
  }
}
