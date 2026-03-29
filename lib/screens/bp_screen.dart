import 'package:flutter/material.dart';

class BPScreen extends StatelessWidget {
  const BPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blood Pressure')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Open BP entry form later
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add BP reading - coming soon')),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text(
          'Blood Pressure History\n\n(Charts & list will appear here)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}