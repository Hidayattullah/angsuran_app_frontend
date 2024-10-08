import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../datas/repositories/penalty_repository.dart';
import '../../domain/usescases/penalty/get_penalty.dart';
import '../controllers/penalty_controller.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/penalty_card.dart';

class PenaltyPage extends StatefulWidget {
  const PenaltyPage({super.key});

  @override
  _PenaltyPageState createState() => _PenaltyPageState();
}

class _PenaltyPageState extends State<PenaltyPage> {
  final PenaltyController penaltyController = Get.put(
    PenaltyController(
      GetPenalties(PenaltyRepository()),
      GetPenaltyById(PenaltyRepository()),
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
        title: const Text('Penalties'),
      ),
      body: FutureBuilder(
        future: penaltyController.fetchPenalties(), // Method to fetch data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching penalties'));
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
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
