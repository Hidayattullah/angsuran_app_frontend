import 'package:flutter/material.dart';
import '../../datas/models/contract_model.dart';
import 'package:intl/intl.dart'; // For formatting dates

class ContractCard extends StatelessWidget {
  final Contract contract;

  const ContractCard({super.key, required this.contract});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter = NumberFormat.simpleCurrency();
    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contract Number: ${contract.contractNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text('Client: ${contract.clientName}'),
            const SizedBox(height: 8),
            Text('OTR: ${currencyFormatter.format(contract.otr)}'),
            const SizedBox(height: 8),
            Text('Down Payment: ${currencyFormatter.format(contract.downPayment)}'),
            const SizedBox(height: 8),
            Text('Start Date: ${dateFormatter.format(contract.startDate)}'),
            const SizedBox(height: 8),
            Text('End Date: ${dateFormatter.format(contract.endDate)}'),
          ],
        ),
      ),
    );
  }
}
