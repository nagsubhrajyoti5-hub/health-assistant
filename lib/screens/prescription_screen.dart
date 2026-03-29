import 'package:flutter/material.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Records')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Prescriptions & Lab Reports',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Open camera/OCR later
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Scan Prescription - coming soon')),
                );
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Scan Prescription'),
            ),
          ],
        ),
      ),
    );
  }
}