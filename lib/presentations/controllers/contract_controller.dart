import 'package:get/get.dart';
import '../../datas/models/contract_model.dart';
import '../../domain/usescases/contract/get_contract.dart';


class ContractController extends GetxController {
  final GetContracts _getContracts;

  // Observable list to hold contracts
  var contracts = <Contract>[].obs;
  var isLoading = true.obs;

  ContractController(this._getContracts);

  @override
  void onInit() {
    super.onInit();
    fetchContracts();
  }

  // Function to fetch contracts from the use case
  Future<void> fetchContracts() async {
    try {
      isLoading(true);
      final contractList = await _getContracts.call();
      contracts.assignAll(contractList); // Assign fetched contracts to the observable list
    } catch (e) {
      // Handle error
      Get.snackbar('Error', 'Failed to load contracts');
    } finally {
      isLoading(false);
    }
  }
}
