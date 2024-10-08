import 'package:flutter/material.dart';
import '../../datas/models/installment_model.dart';

class InstallmentList extends StatelessWidget {
  final List<Installment> installments;

  const InstallmentList({super.key, required this.installments});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: installments.length,
      itemBuilder: (context, index) {
        final installment = installments[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * 0.04),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsif padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Installment No: ${installment.installmentNo}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.045),
                ),
                const SizedBox(height: 8),
                Text('Amount Per Month: \$${installment.amountPerMonth}'),
                const SizedBox(height: 8),
                Text('Principal Amount: \$${installment.principalAmount}'),
                const SizedBox(height: 8),
                Text('Due Date: ${installment.dueDate}'),
                const SizedBox(height: 8),
                Text('Status: ${installment.status}'),
                const SizedBox(height: 8),
                Text('Paid Off: ${installment.isPaidOff ? "Yes" : "No"}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
