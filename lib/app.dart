import 'package:base_project_flutter/core/themes/custom_theme.dart';
import 'package:base_project_flutter/features/settings/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:base_project_flutter/router_config.dart';

class SimetaApp extends StatefulWidget {
  const SimetaApp({super.key});

  @override
  State<SimetaApp> createState() => _SimetaAppState();
}

class _SimetaAppState extends State<SimetaApp> {
  // Router yang diinisialisasi sekali dan tidak akan direbuild saat tema berubah
  late final GoRouter _routerConfig;

  @override
  void initState() {
    super.initState();
    // Inisialisasi router sekali
    _routerConfig = AppRouter.router(context);
  }

  @override
  Widget build(BuildContext context) {
    Color seedColor = Colors.blue;
    return ListenableBuilder(
      listenable: context.watch<SettingsProvider>(),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Simeta Mobile',
          theme: AppTheme.lightTheme(
            seedColor: seedColor,
            fontFamily: context.watch<SettingsProvider>().fontFamily,
          ),
          darkTheme: AppTheme.darkTheme(
            seedColor: seedColor,
            fontFamily: context.watch<SettingsProvider>().fontFamily,
          ),
          themeMode: context.watch<SettingsProvider>().themeMode,
          routerConfig: _routerConfig,
        );
      },
    );
  }
}
