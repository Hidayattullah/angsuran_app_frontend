import 'package:get/get.dart';
import '../../datas/repositories/penalty_repository.dart';
import '../../domain/usescases/penalty/get_penalty.dart';
import '../controllers/penalty_controller.dart';

class PenaltyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PenaltyController(
      GetPenalties(PenaltyRepository()),
      GetPenaltyById(PenaltyRepository()),
    ));
  }
}
