import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  runApp(HealthAssistantApp());
}

class HealthAssistantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Assistant',
      theme: ThemeData.dark(useMaterial3: true),
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}