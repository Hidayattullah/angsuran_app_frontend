import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../datas/repositories/contract_repository.dart';
import '../../domain/usescases/contract/get_contract.dart';
import '../controllers/contract_controller.dart';
import '../widgets/contract_card.dart';
import '../widgets/custom_bottom_navigation.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  final ContractController contractController = Get.put(
    ContractController(
      GetContracts(ContractRepository()),
    ),
  );

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contracts'),
      ),
      body: Obx(() {
        if (contractController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (contractController.contracts.isEmpty) {
          return const Center(child: Text('No contracts available'));
        }

        return ListView.builder(
          itemCount: contractController.contracts.length,
          itemBuilder: (context, index) {
            final contract = contractController.contracts[index];
            return ContractCard(contract: contract);
          },
        );
      }),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
