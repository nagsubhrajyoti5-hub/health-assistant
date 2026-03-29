import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/bp_reading.dart';

class BPScreen extends StatefulWidget {
  const BPScreen({super.key});

  @override
  State<BPScreen> createState() => _BPScreenState();
}

class _BPScreenState extends State<BPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _pulseController = TextEditingController();
  final _notesController = TextEditingController();
  String _position = "Sitting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blood Pressure')),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBPDialog,
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<BPReading>('bpReadings').listenable(),
        builder: (context, Box<BPReading> box, _) {
          final readings = box.values.toList()..sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

          if (readings.isEmpty) {
            return const Center(child: Text('No readings yet.\nTap + to add your first BP', textAlign: TextAlign.center));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: readings.length,
            itemBuilder: (context, index) {
              final reading = readings[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: reading.categoryColor.withOpacity(0.2),
                    child: Text(reading.category[0], style: TextStyle(color: reading.categoryColor, fontWeight: FontWeight.bold)),
                  ),
                  title: Text('${reading.systolic}/${reading.diastolic} mmHg'),
                  subtitle: Text('${reading.pulse} bpm • ${reading.position ?? ""} • ${DateFormat('dd MMM yyyy hh:mm a').format(reading.recordedAt)}'),
                  trailing: Text(reading.category, style: TextStyle(color: reading.categoryColor, fontWeight: FontWeight.w500)),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddBPDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add BP Reading'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(controller: _systolicController, decoration: const InputDecoration(labelText: 'Systolic'), keyboardType: TextInputType.number),
                TextFormField(controller: _diastolicController, decoration: const InputDecoration(labelText: 'Diastolic'), keyboardType: TextInputType.number),
                TextFormField(controller: _pulseController, decoration: const InputDecoration(labelText: 'Pulse'), keyboardType: TextInputType.number),
                DropdownButtonFormField<String>(
                  value: _position,
                  items: const ["Sitting", "Standing", "Lying"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => _position = v!,
                  decoration: const InputDecoration(labelText: 'Position'),
                ),
                TextFormField(controller: _notesController, decoration: const InputDecoration(labelText: 'Notes (optional)')),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final box = Hive.box<BPReading>('bpReadings');
                final reading = BPReading(
                  id: const Uuid().v4(),
                  systolic: int.parse(_systolicController.text),
                  diastolic: int.parse(_diastolicController.text),
                  pulse: int.parse(_pulseController.text),
                  recordedAt: DateTime.now(),
                  notes: _notesController.text.isEmpty ? null : _notesController.text,
                  position: _position,
                );
                box.add(reading);

                _systolicController.clear();
                _diastolicController.clear();
                _pulseController.clear();
                _notesController.clear();

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('BP reading saved ✅')));
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}