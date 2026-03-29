import 'package:flutter/material.dart';
import 'navigation/main_navigation.dart';

void main() {
  runApp(const HealthAssistantApp());
}

class HealthAssistantApp extends StatelessWidget {
  const HealthAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system, // will be controlled later from Settings
      home: const MainNavigation(),
    );
  }
}