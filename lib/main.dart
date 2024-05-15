import 'package:etec_tcc/pages/internal/home_page.dart';
import 'package:flutter/material.dart';
import 'pages/external/login_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // brightness: Brightness.dark,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),// Set default text color
      ),
      useMaterial3: true,
      fontFamily: 'Poppins',
    ),
    home: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const HomePage(),
    ),
  ));
}
