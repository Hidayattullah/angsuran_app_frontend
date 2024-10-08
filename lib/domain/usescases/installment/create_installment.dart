// lib/domain/usecases/installment/create_installment.dart

import '../../../datas/models/installment_model.dart';
import '../../../datas/repositories/installment_repository.dart';

class CreateInstallment {
  final InstallmentRepository _repository;

  CreateInstallment(this._repository);

  Future<Installment> call(Installment installment) async {
    return await _repository.createInstallment(installment);
  }
}
