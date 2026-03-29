import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Latest BP Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(Icons.monitor_heart, size: 48, color: Colors.teal),
                title: const Text('Latest BP', style: TextStyle(fontSize: 18)),
                subtitle: const Text('120/80 mmHg • Normal', style: TextStyle(fontSize: 16)),
                trailing: const Text('Today', style: TextStyle(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 16),

            // Today's Medicines Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(Icons.medication, size: 48, color: Colors.orange),
                title: const Text("Today's Medicines", style: TextStyle(fontSize: 18)),
                subtitle: const Text('2 doses remaining • All taken', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 16),

            // Health Score Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(Icons.favorite, size: 48, color: Colors.pink),
                title: const Text('Health Score', style: TextStyle(fontSize: 18)),
                subtitle: const Text('92/100 • Excellent', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}