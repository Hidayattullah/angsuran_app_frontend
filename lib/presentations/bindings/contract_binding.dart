import 'package:get/get.dart';
import '../../datas/repositories/contract_repository.dart';
import '../../domain/usescases/contract/get_contract.dart';
import '../controllers/contract_controller.dart';

class ContractBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContractController(GetContracts(ContractRepository())));
  }
}
