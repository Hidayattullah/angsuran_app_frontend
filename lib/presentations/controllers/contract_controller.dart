import 'package:flutter/foundation.dart';
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
    isLoading(true); // Start loading
    try {
      final contractList = await _getContracts.call();
      if (kDebugMode) {
        print('Fetched Contracts: ${contractList.length}');
      } // Log the number of fetched contracts
      contracts.assignAll(contractList); // Assign fetched contracts to the observable list
      if (kDebugMode) {
        print('Contracts: $contracts');
      } // Log the contracts data
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error fetching contracts: $e');
      } // Log the error
      Get.snackbar('Error', 'Failed to load contracts');
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
