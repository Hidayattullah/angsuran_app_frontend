import 'package:get/get.dart';

import '../../datas/models/penalty_model.dart';
import '../../domain/usescases/penalty/get_penalty.dart';

class PenaltyController extends GetxController {
  final GetPenalties getPenaltiesUseCase;
  final GetPenaltyById getPenaltyByIdUseCase;

  PenaltyController(
    this.getPenaltiesUseCase,
    this.getPenaltyByIdUseCase,
  );

  var penalties = <Penalty>[].obs;
  var isLoading = true.obs;
  var selectedPenalty = Rxn<Penalty>();

  @override
  void onInit() {
    fetchPenalties();
    super.onInit();
  }

  Future<void> fetchPenalties() async {
    try {
      isLoading(true);
      final result = await getPenaltiesUseCase();
      penalties.assignAll(result);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchPenaltyById(int id) async {
    try {
      isLoading(true);
      final result = await getPenaltyByIdUseCase(id);
      selectedPenalty.value = result;
    } finally {
      isLoading(false);
    }
  }
}
