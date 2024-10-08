// lib/domain/usecases/installment/get_installment.dart
import '../../../datas/models/installment_model.dart';
import '../../../datas/repositories/installment_repository.dart';

class GetInstallments {
  final InstallmentRepository _repository;

  GetInstallments(this._repository);

  Future<List<Installment>> call() async {
    return await _repository.getInstallments();
  }
}
