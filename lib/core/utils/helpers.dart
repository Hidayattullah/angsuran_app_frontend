// lib/core/utils/helpers.dart

import 'package:intl/intl.dart';

class Helpers {
  // Function to format currency
  static String formatCurrency(num amount) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
    );
    return currencyFormatter.format(amount);
  }

  // Function to format date
  static String formatDate(DateTime date) {
    final DateFormat dateFormatter = DateFormat('dd MMM yyyy');
    return dateFormatter.format(date);
  }

  // Function to check if a string is null or empty
  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  // Function to handle API error messages
  static String handleApiError(Map<String, dynamic> error) {
    return error['message'] ?? 'An unknown error occurred';
  }
}
