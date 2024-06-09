import 'package:etec_tcc/pages/internal/route_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white), // Set default text color
      ),
      useMaterial3: true,
      fontFamily: 'Poppins',
    ),
    home: const Scaffold(
      body: RouteProvider(),
    ),
  ));
}
