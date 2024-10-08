import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../datas/repositories/installment_repository.dart';
import '../../domain/usescases/installment/get_installment.dart';
import '../controllers/installment_controller.dart';
import '../widgets/installment_list.dart';


class InstallmentPage extends StatelessWidget {
  final InstallmentController installmentController;

  InstallmentPage({super.key})
      : installmentController = Get.put(
          InstallmentController(
            GetInstallments(InstallmentRepository()),
            GetInstallmentById(InstallmentRepository()),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Installments'),
      ),
      body: Obx(() {
        if (installmentController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (installmentController.installments.isEmpty) {
          return const Center(child: Text('No installments available'));
        }

        return InstallmentList(installments: installmentController.installments);
      }),
    );
  }
}
