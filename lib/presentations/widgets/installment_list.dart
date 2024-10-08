import 'package:flutter/material.dart';
import '../../datas/models/installment_model.dart';

class InstallmentList extends StatelessWidget {
  final List<Installment> installments;

  const InstallmentList({super.key, required this.installments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: installments.length,
      itemBuilder: (context, index) {
        final installment = installments[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Installment No: ${installment.installmentNo}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
