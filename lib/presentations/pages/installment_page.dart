import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../datas/repositories/installment_repository.dart';
import '../../domain/usescases/installment/get_installment.dart';
import '../controllers/installment_controller.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/installment_list.dart';

class InstallmentPage extends StatefulWidget {
  const InstallmentPage({super.key});

  @override
  _InstallmentPageState createState() => _InstallmentPageState();
}

class _InstallmentPageState extends State<InstallmentPage> {
  final InstallmentController installmentController = Get.put(
    InstallmentController(
      GetInstallments(InstallmentRepository()),
      GetInstallmentById(InstallmentRepository()),
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
        title: const Text('Installments'),
      ),
      body: FutureBuilder(
        future: installmentController.fetchInstallments(), // Method to fetch data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching installments'));
          }

          if (installmentController.installments.isEmpty) {
            return const Center(child: Text('No installments available'));
          }

          return InstallmentList(installments: installmentController.installments);
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
