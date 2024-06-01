import 'package:flutter/material.dart';
import 'package:newapp/Splash/Splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(size: 26),
            unselectedIconTheme: IconThemeData(size: 20),
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 1, 60, 64),
            unselectedItemColor: Color.fromARGB(141, 241, 255, 186),
            selectedItemColor: Color.fromARGB(255, 241, 255, 186),
          ),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Color.fromARGB(255, 1, 60, 64))),
          scaffoldBackgroundColor: const Color.fromARGB(255, 223, 241, 149)),
      home: const splash(),
    );
  }
}
