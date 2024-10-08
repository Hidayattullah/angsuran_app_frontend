import 'package:flutter/material.dart';
import '../../datas/models/penalty_model.dart';

class PenaltyCard extends StatelessWidget {
  final Penalty penalty;

  const PenaltyCard({super.key, required this.penalty});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * 0.04),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsif padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Penalty ID: ${penalty.id}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.045),
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
