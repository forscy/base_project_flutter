import 'package:base_project_flutter/features/settings/providers/settings_provider.dart';
import 'package:base_project_flutter/features/settings/ui/widgets/font_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        // back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Pop the current route and go back to the previous one
            
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Theme Mode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButton<ThemeMode>(
              value: context.watch<SettingsProvider>().themeMode,
              onChanged: (ThemeMode? newValue) {
                if (newValue != null) {
                  context.read<SettingsProvider>().updateThemeMode(newValue);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Font Family',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              title: Consumer<SettingsProvider>(
                builder:
                    (context, value, child) =>
                        Text('Current Font: ${value.fontFamily}'),
              ),
              subtitle: Consumer<SettingsProvider>(
                builder:
                    (context, value, child) => Text(
                      'Sample text with this font',
                      style: TextStyle(fontFamily: value.fontFamily),
                    ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FontSelectionView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
