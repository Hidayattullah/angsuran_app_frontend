import 'package:flutter/material.dart';
import 'presentations/pages/home_page.dart'; // Import file home_page.dart

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Tambahkan ini untuk memastikan semuanya diinisialisasi dengan benar
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angsuran Kalkulator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Angsuran Kalkulator'), // Gunakan MyHomePage dari home_page.dart
    );
  }
}
