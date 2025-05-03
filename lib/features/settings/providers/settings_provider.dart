import 'package:flutter/material.dart';
import 'settings_service.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider(this._settingsService);

  final SettingsService _settingsService;

  // Theme
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  // Font
  late String _fontFamily;
  String get fontFamily => _fontFamily;

  // Load settings
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _fontFamily = await _settingsService.fontFamily();
    notifyListeners();
  }

  // Update theme
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }

  // Update font
  Future<void> updateFontFamily(String newFontFamily) async {
    if (newFontFamily == _fontFamily) return;

    _fontFamily = newFontFamily;
    notifyListeners();

    await _settingsService.updateFontFamily(newFontFamily);
  }
}
