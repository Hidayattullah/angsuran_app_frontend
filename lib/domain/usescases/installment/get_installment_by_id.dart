// lib/domain/usecases/installment/get_installment_by_id.dart
import '../../../datas/models/installment_model.dart';
import '../../../datas/repositories/installment_repository.dart';

class GetInstallmentById {
  final InstallmentRepository _repository;

  GetInstallmentById(this._repository);

  Future<Installment> call(int id) async {
    return await _repository.getInstallment(id);
  }
}
