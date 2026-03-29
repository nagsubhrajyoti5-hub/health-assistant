import 'package:flutter/material.dart';

class BPScreen extends StatefulWidget {
  const BPScreen({super.key});

  @override
  State<BPScreen> createState() => _BPScreenState();
}

class _BPScreenState extends State<BPScreen> {
  final systolicController = TextEditingController();
  final diastolicController = TextEditingController();

  String result = "";

  void calculateBP() {
    final sys = int.tryParse(systolicController.text) ?? 0;
    final dia = int.tryParse(diastolicController.text) ?? 0;

    if (sys == 0 || dia == 0) {
      setState(() => result = "Enter valid values");
      return;
    }

    if (sys < 120 && dia < 80) {
      result = "Normal";
    } else if (sys < 130 && dia < 80) {
      result = "Elevated";
    } else if (sys < 140 || dia < 90) {
      result = "High BP Stage 1";
    } else {
      result = "High BP Stage 2";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BP Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: systolicController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Systolic"),
            ),
            TextField(
              controller: diastolicController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Diastolic"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBP,
              child: const Text("Check BP"),
            ),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}