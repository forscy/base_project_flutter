import 'package:base_project_flutter/features/settings/providers/settings_service.dart';
import 'package:flutter/material.dart';

// Definisi ThemeExtension untuk warna kustom
class CustomColorsTheme extends ThemeExtension<CustomColorsTheme> {
  const CustomColorsTheme({
    required this.success,
    required this.error,
    required this.warning,
    this.onSuccess,
    this.onError,
    this.onWarning,
  });

  final Color? success;
  final Color? error;
  final Color? warning;
  final Color? onSuccess;
  final Color? onError;
  final Color? onWarning;

  // Implementasi copyWith yang benar
  @override
  CustomColorsTheme copyWith({
    Color? success,
    Color? error,
    Color? warning,
    Color? onSuccess,
    Color? onError,
    Color? onWarning,
  }) {
    return CustomColorsTheme(
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      onSuccess: onSuccess ?? this.onSuccess,
      onError: onError ?? this.onError,
      onWarning: onWarning ?? this.onWarning,
    );
  }

  // Implementasi lerp yang benar
  @override
  CustomColorsTheme lerp(covariant CustomColorsTheme? other, double t) {
    if (other is! CustomColorsTheme) {
      return this;
    }
    return CustomColorsTheme(
      success: Color.lerp(success, other.success, t),
      error: Color.lerp(error, other.error, t),
      warning: Color.lerp(warning, other.warning, t),
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t),
      onError: Color.lerp(onError, other.onError, t),
      onWarning: Color.lerp(onWarning, other.onWarning, t),
    );
  }

  // Metode untuk mendapatkan warna onSuccess yang aman
  Color getSuccessForegroundColor(BuildContext context) {
    return onSuccess ?? Theme.of(context).colorScheme.onPrimary;
  }

  // Metode untuk mendapatkan warna onError yang aman
  Color getErrorForegroundColor(BuildContext context) {
    return onError ?? Theme.of(context).colorScheme.onPrimary;
  }

  // Metode untuk mendapatkan warna onWarning yang aman
  Color getWarningForegroundColor(BuildContext context) {
    return onWarning ?? Theme.of(context).colorScheme.onPrimary;
  }
}

// Ekstensi pada ThemeData untuk memudahkan akses ke CustomColorsTheme
extension ThemeDataExtension on ThemeData {
  CustomColorsTheme get customColorsTheme => extension<CustomColorsTheme>()!;
}

class AppTheme {
  static ThemeData lightTheme({
    Color seedColor = Colors.blue,
    String? fontFamily,
  }) {
    // Jika fontFamily tidak diberikan, gunakan font default
    fontFamily ??= SettingsService.availableFonts[0];
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      extensions: <ThemeExtension<dynamic>>[
        const CustomColorsTheme(
          success: Color(0xFF4CAF50),
          error: Color(0xFFF44336),
          warning: Color(0xFFFF9800),
          onSuccess: Colors.white, // Warna teks yang sesuai untuk tema terang
          onError: Colors.white, // Warna teks yang sesuai untuk tema terang
          onWarning: Colors.black, // Warna teks yang sesuai untuk tema terang
        ),
      ],
      fontFamily: fontFamily,
    );
  }

  static ThemeData darkTheme({
    Color seedColor = Colors.blue,
    String? fontFamily,
  }) {
    // Jika fontFamily tidak diberikan, gunakan font default
    fontFamily ??= SettingsService.availableFonts[0];
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      extensions: <ThemeExtension<dynamic>>[
        const CustomColorsTheme(
          success: Color(0xFF81C784), // Warna lebih terang untuk tema gelap
          error: Color(0xFFE57373), // Warna lebih terang untuk tema gelap
          warning: Color(0xFFFFB74D), // Warna lebih terang untuk tema gelap
          onSuccess: Colors.black, // Warna teks yang sesuai untuk tema gelap
          onError: Colors.black, // Warna teks yang sesuai untuk tema gelap
          onWarning: Colors.black, // Warna teks yang sesuai untuk tema gelap
        ),
      ],
      fontFamily: fontFamily,
    );
  }
}
