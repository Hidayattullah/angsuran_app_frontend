import 'package:flutter/material.dart';
import 'package:angsuran_frontend/presentations/pages/contract_page.dart';
import 'package:angsuran_frontend/presentations/pages/installment_page.dart';
import 'package:angsuran_frontend/presentations/pages/penalty_page.dart';

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ContractPage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PenaltyPage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const InstallmentPage()),
            );
            break;
        }
      },
    );
  }
}
