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
    try {
      isLoading(true);
      final result = await getInstallmentsUseCase();
      installments.assignAll(result);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchInstallmentById(int id) async {
    try {
      isLoading(true);
      final result = await getInstallmentByIdUseCase(id);
      selectedInstallment.value = result;
    } finally {
      isLoading(false);
    }
  }
}
