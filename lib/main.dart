import 'package:base_project_flutter/core/providers/server_time_provider.dart';
import 'package:base_project_flutter/core/services/server_time_service.dart';
import 'package:base_project_flutter/features/auth/auth_provider.dart';
import 'package:base_project_flutter/features/settings/providers/settings_provider.dart';
import 'package:base_project_flutter/features/settings/providers/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:base_project_flutter/app.dart';
import 'package:base_project_flutter/navigation_state.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Ensure Flutter is initialized before calling any platform channels
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the app intl indonesian wib
  await initializeDateFormatting('id_ID', null);

  try {
    // Create and initialize AuthProvider
    final authProvider = AuthProvider();
    await authProvider.initialize();

    // Initialize settings with error handling
    final settingsService = SettingsService();
    final settingsController = SettingsProvider(settingsService);

    final serverTimeService = ServerTimeService();
    final serverTimeController = ServerTimeProvider(serverTimeService);

    // Initialize the services

    try {
      await settingsController.loadSettings();
      await serverTimeController.fetchServerTime();
    } catch (e) {
      // Handle error loading settings or server time
      // Continue with default settings
    }

    runApp(
      MultiProvider(
        providers: [
          // App state
          ChangeNotifierProvider(create: (context) => NavigationState()),
          ChangeNotifierProvider(create: (_) => settingsController),
          ChangeNotifierProvider(create: (_) => serverTimeController),

          // Auth
          ChangeNotifierProvider.value(value: authProvider),
        ],
        child: const SimetaApp(),
      ),
    );
  } catch (e, stackTrace) {
    // Log any initialization errors
    debugPrint('Error during app initialization: $e');
    debugPrint(stackTrace.toString());

    // Run a minimal fallback app if initialization fails
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Failed to initialize app: $e')),
        ),
      ),
    );
  }
}
