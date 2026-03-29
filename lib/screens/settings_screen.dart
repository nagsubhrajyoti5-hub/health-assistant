import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('System theme is used by default'),
            value: _darkMode,
            onChanged: (value) {
              setState(() => _darkMode = value);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Theme update coming in next version')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('App Lock'),
            subtitle: const Text('Biometric / PIN (coming soon)'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.file_download_outlined),
            title: const Text('Export Report'),
            subtitle: const Text('PDF for doctor visit'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.smart_toy_outlined),
            title: const Text('AI Health Advisor'),
            subtitle: const Text('Super-smart chat with your data'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('AI Advisor coming in next step')),
              );
            },
          ),
        ],
      ),
    );
  }
}