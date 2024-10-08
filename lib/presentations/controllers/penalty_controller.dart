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
    isLoading(true); // Start loading
    try {
      final result = await getPenaltiesUseCase();
      penalties.assignAll(result);
    } catch (e) {
      // Handle error
      Get.snackbar('Error', 'Failed to load penalties');
    } finally {
      isLoading(false); // Stop loading
    }
  }

  Future<void> fetchPenaltyById(int id) async {
    isLoading(true); // Start loading
    try {
      final result = await getPenaltyByIdUseCase(id);
      selectedPenalty.value = result;
    } catch (e) {
      // Handle error
      Get.snackbar('Error', 'Failed to load penalty');
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
