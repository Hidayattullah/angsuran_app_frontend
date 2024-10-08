import 'package:get/get.dart';
import '../../datas/repositories/contract_repository.dart';
import '../../datas/repositories/installment_repository.dart';
import '../../datas/repositories/penalty_repository.dart';
import '../../domain/usescases/contract/get_contract.dart';
import '../../domain/usescases/installment/get_installment.dart';
import '../../domain/usescases/penalty/get_penalty.dart';
import '../controllers/contract_controller.dart';
import '../controllers/installment_controller.dart';
import '../controllers/penalty_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Instantiate repositories only once for reuse
    final contractRepository = ContractRepository();
    final installmentRepository = InstallmentRepository();
    final penaltyRepository = PenaltyRepository();

    // Register controllers and pass respective use cases
    Get.put(ContractController(GetContracts(contractRepository)));
    Get.put(InstallmentController(
      GetInstallments(installmentRepository),
      GetInstallmentById(installmentRepository), // Ensure this is passed correctly
    ));
    Get.put(PenaltyController(
      GetPenalties(penaltyRepository),
      GetPenaltyById(penaltyRepository), // Make sure this is handled correctly
    ));
  }
}
