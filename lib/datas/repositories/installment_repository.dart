// lib/data/repositories/installment_repository.dart

import '../models/installment_model.dart';
import '../providers/installment_provider.dart';

class InstallmentRepository {
  final InstallmentProvider _installmentProvider = InstallmentProvider();

  Future<List<Installment>> getInstallments() {
    return _installmentProvider.getAllInstallments();
  }

  Future<Installment> getInstallment(int id) {
    return _installmentProvider.getInstallmentById(id); // Fetch installment by ID
  }

  // Fungsi untuk membuat installment
  Future<Installment> createInstallment(Installment installment) {
    return _installmentProvider.createInstallment(installment);
  }

  // Fungsi untuk memperbarui installment
  Future<Installment> updateInstallment(int id, Installment installment) {
    return _installmentProvider.updateInstallment(id, installment);
  }

  Future<void> deleteInstallment(int id) {
    return _installmentProvider.deleteInstallment(id);
  }
}
