import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../datas/repositories/penalty_repository.dart';
import '../../domain/usescases/penalty/get_penalty.dart';
import '../controllers/penalty_controller.dart';
import '../widgets/penalty_card.dart';


class PenaltyPage extends StatelessWidget {
  final PenaltyController penaltyController;

  PenaltyPage({super.key})
      : penaltyController = Get.put(
          PenaltyController(
            GetPenalties(PenaltyRepository()),
            GetPenaltyById(PenaltyRepository()),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penalties'),
      ),
      body: Obx(() {
        if (penaltyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (penaltyController.penalties.isEmpty) {
          return const Center(child: Text('No penalties available'));
        }

        return ListView.builder(
          itemCount: penaltyController.penalties.length,
          itemBuilder: (context, index) {
            final penalty = penaltyController.penalties[index];
            return PenaltyCard(penalty: penalty);
          },
        );
      }),
    );
  }
}
