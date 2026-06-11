import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/views/login_screen.dart';
import 'views/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jadwalku',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1E2746), // Warna Navy background utama
        primaryColor: const Color(0xFFF37B23), // Warna Orange aksen
        fontFamily: 'Roboto', // Bisa disesuaikan dengan font pilihanmu (misal: Poppins)
      ),
      home: const LoginScreen(),
    );
  }
}