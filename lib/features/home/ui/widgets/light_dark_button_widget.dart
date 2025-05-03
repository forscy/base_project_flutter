import 'package:base_project_flutter/features/settings/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LightDarkButtonWidget extends StatefulWidget {
  const LightDarkButtonWidget({super.key});

  @override
  State<LightDarkButtonWidget> createState() => _LightDarkButtonWidgetState();
}

class _LightDarkButtonWidgetState extends State<LightDarkButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? Icons.wb_sunny
            : Icons.nightlight_round,
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.yellow
                : Colors.blueGrey,
      ),
      onPressed: () {
        Provider.of<SettingsProvider>(context, listen: false).updateThemeMode(
          Theme.of(context).brightness == Brightness.dark
              ? ThemeMode.light
              : ThemeMode.dark,
        );
      },
    );
  }
}
