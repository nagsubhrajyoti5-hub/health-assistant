import 'package:flutter/material.dart';
import '../models/bp_model.dart';

class BPScreen extends StatefulWidget {
  const BPScreen({super.key});

  @override
  State<BPScreen> createState() => _BPScreenState();
}

class _BPScreenState extends State<BPScreen> {
  final systolicController = TextEditingController();
  final diastolicController = TextEditingController();

  List<BPModel> data = [];

  void addBP() {
    final sys = int.tryParse(systolicController.text);
    final dia = int.tryParse(diastolicController.text);

    if (sys == null || dia == null) return;

    data.add(BPModel(
      systolic: sys,
      diastolic: dia,
      date: DateTime.now(),
    ));

    systolicController.clear();
    diastolicController.clear();

    setState(() {});
  }

  String getPrediction() {
    if (data.length < 2) return "Not enough data";

    final last = data[data.length - 1];
    final prev = data[data.length - 2];

    if (last.systolic > prev.systolic) return "Increasing ⚠️";
    if (last.systolic < prev.systolic) return "Improving ✅";
    return "Stable";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blood Pressure")),
      body: Padding(
        padding: const EdgeInsets.all(12),
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
            const SizedBox(height: 10),
            ElevatedButton(onPressed: addBP, child: const Text("Add BP")),

            const SizedBox(height: 10),
            Text(getPrediction()),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, i) {
                  final bp = data[i];
                  return ListTile(
                    title: Text("${bp.systolic}/${bp.diastolic}"),
                    subtitle: Text(bp.date.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}