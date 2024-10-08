import 'package:flutter/material.dart';
import '../../datas/models/penalty_model.dart';

class PenaltyCard extends StatelessWidget {
  final Penalty penalty;

  const PenaltyCard({super.key, required this.penalty});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Penalty ID: ${penalty.id}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text('Penalty Amount: \$${penalty.penaltyAmount}'),
            const SizedBox(height: 8),
            Text('Penalty Reason: ${penalty.penaltyReason}'),
            const SizedBox(height: 8),
            if (penalty.penaltyDate != null)
              Text('Penalty Date: ${penalty.penaltyDate}'),
            const SizedBox(height: 8),
            if (penalty.installment != null)
              Text('Installment ID: ${penalty.installment?.id}'),
            const SizedBox(height: 8),
            if (penalty.createdAt != null)
              Text('Created At: ${penalty.createdAt}'),
            const SizedBox(height: 8),
            if (penalty.updatedAt != null)
              Text('Updated At: ${penalty.updatedAt}'),
          ],
        ),
      ),
    );
  }
}
