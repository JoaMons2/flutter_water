import 'package:flutter/material.dart';
import 'package:water_counter_app/screens/start_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agüita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.indigo,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        ),
        textTheme:
        const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 76, 169, 228),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold
            ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 68, 154, 243),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const StartScreen(),
    );
  }
}
