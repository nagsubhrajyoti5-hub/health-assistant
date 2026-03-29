import 'package:flutter/material.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicines')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Open Add Medicine form later
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add new medicine - coming soon')),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text(
          'Your Medicines\n\n(Stock, schedule & reminders will appear here)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}