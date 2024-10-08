// lib/data/repositories/installment_repository.dart

import '../models/installment_model.dart';
import '../providers/installment_provider.dart';

class InstallmentRepository {
  final InstallmentProvider _installmentProvider = InstallmentProvider();

  Future<List<Installment>> getInstallments() {
    return _installmentProvider.getAllInstallments();
  }

  Future<Installment> getInstallment(int id) {
    return _installmentProvider.getInstallmentById(id);
  }

  // Tambahkan fungsi create installment
  Future<Installment> createInstallment(Installment installment) {
    return _installmentProvider.createInstallment(installment);
  }

  // Tambahkan fungsi update installment
  Future<Installment> updateInstallment(int id, Installment installment) {
    return _installmentProvider.updateInstallment(id, installment);
  }
}
