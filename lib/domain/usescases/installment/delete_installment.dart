// lib/domain/usecases/installment/delete_installment.dart

import '../../../datas/repositories/installment_repository.dart';

class DeleteInstallment {
  final InstallmentRepository _repository;

  DeleteInstallment(this._repository);

  Future<void> call(int id) async {
    await _repository.deleteInstallment(id); // Fungsi ini perlu ditambahkan di repository.
  }
}
