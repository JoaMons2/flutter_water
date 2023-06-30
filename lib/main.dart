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
        textTheme: 
        const TextTheme(
          headlineSmall: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 137, 186, 243),
          ),
        ),
        useMaterial3: true,
      ),
      home: const StartScreen(),
    );
  }
}
