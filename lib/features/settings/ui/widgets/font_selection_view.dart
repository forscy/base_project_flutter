import 'package:base_project_flutter/features/settings/providers/settings_provider.dart';
import 'package:base_project_flutter/features/settings/providers/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FontSelectionView extends StatelessWidget {
  const FontSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Font')),
      body: ListView.builder(
        itemCount: SettingsService.availableFonts.length,
        itemBuilder: (context, index) {
          final fontFamily = SettingsService.availableFonts[index];
          final isSelected =
              context.watch<SettingsProvider>().fontFamily == fontFamily;

          return ListTile(
            title: Text(
              fontFamily,
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            subtitle: Text(
              'Sample text with $fontFamily font',
              style: TextStyle(fontFamily: fontFamily),
            ),
            trailing: isSelected ? const Icon(Icons.check) : null,
            onTap: () {
              context.read<SettingsProvider>().updateFontFamily(fontFamily);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
