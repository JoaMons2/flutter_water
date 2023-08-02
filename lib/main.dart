import 'package:flutter/material.dart';
import 'package:water_counter_app/screens/start_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agüita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color.fromARGB(255, 63, 84, 206),
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        ),
        textTheme: const TextTheme(
          headlineSmall:
              TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 76, 169, 248),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12,
            fontWeight: FontWeight.bold
            ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            //backgroundColor: const Color.fromARGB(255, 68, 154, 243),
            //foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const StartScreen(hidratacion: 0,valueWater: 0,),
    );
  }
}
