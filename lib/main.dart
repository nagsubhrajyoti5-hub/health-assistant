import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/bp_reading.dart';
import 'navigation/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BPReadingAdapter());
  await Hive.openBox<BPReading>('bpReadings');
  runApp(const HealthAssistantApp());
}

class HealthAssistantApp extends StatelessWidget {
  const HealthAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      darkTheme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal, brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const MainNavigation(),
    );
  }
}