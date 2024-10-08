import 'package:get/get.dart';
import '../../datas/models/installment_model.dart';
import '../../domain/usescases/installment/get_installment.dart';

class InstallmentController extends GetxController {
  final GetInstallments getInstallmentsUseCase;
  final GetInstallmentById getInstallmentByIdUseCase;

  InstallmentController(
    this.getInstallmentsUseCase,
    this.getInstallmentByIdUseCase,
  );

  var installments = <Installment>[].obs;
  var isLoading = true.obs;
  var selectedInstallment = Rxn<Installment>();

  @override
  void onInit() {
    fetchInstallments();
    super.onInit();
  }

  Future<void> fetchInstallments() async {
    isLoading(true); // Start loading
    try {
      final result = await getInstallmentsUseCase();
      installments.assignAll(result);
    } catch (e) {
      // Handle error
      Get.snackbar('Error', 'Failed to load installments');
    } finally {
      isLoading(false); // Stop loading
    }
  }

  Future<void> fetchInstallmentById(int id) async {
    isLoading(true); // Start loading
    try {
      final result = await getInstallmentByIdUseCase(id);
      selectedInstallment.value = result;
    } catch (e) {
      // Handle error
      Get.snackbar('Error', 'Failed to load installment');
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
