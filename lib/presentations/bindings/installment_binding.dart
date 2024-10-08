import 'package:get/get.dart';
import '../../datas/repositories/installment_repository.dart';
import '../../domain/usescases/installment/get_installment.dart';
import '../controllers/installment_controller.dart';

class InstallmentBinding extends Bindings {
  @override
  void dependencies() {
    // Instantiate the repository first
    InstallmentRepository installmentRepository = InstallmentRepository();

    // Inject dependencies for the controller
    Get.put(InstallmentController(
      GetInstallments(installmentRepository),   // Pass the repository to GetInstallments use case
      GetInstallmentById(installmentRepository), // Pass the repository to GetInstallmentById use case
    ));
  }
}
