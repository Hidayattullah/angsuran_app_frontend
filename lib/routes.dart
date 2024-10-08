import 'package:get/get.dart';
import 'presentations/bindings/penalty_binding.dart';
import 'presentations/bindings/contract_binding.dart';
import 'presentations/bindings/installment_binding.dart';
import 'presentations/pages/penalty_page.dart'; // Example page
import 'presentations/pages/contract_page.dart'; // Example page
import 'presentations/pages/installment_page.dart'; // Example page

class AppRoutes {
  static const String penalty = '/penalty';
  static const String contract = '/contract';
  static const String installment = '/installment';

  static List<GetPage> routes = [
    GetPage(
      name: penalty,
      page: () => const PenaltyPage(), // Replace with your actual page
      binding: PenaltyBinding(),
    ),
    GetPage(
      name: contract,
      page: () => const ContractPage(), // Replace with your actual page
      binding: ContractBinding(),
    ),
    GetPage(
      name: installment,
      page: () => const InstallmentPage(), // Replace with your actual page
      binding: InstallmentBinding(),
    ),
  ];
}
