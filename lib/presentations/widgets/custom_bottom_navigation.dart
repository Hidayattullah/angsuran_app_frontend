import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Contracts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.warning),
          label: 'Penalties',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money),
          label: 'Installments',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index);
        switch (index) {
          case 0:
            Get.offNamed(AppRoutes.contract); // Navigate to Contract Page
            break;
          case 1:
            Get.offNamed(AppRoutes.penalty); // Navigate to Penalty Page
            break;
          case 2:
            Get.offNamed(AppRoutes.installment); // Navigate to Installment Page
            break;
        }
      },
    );
  }
}
