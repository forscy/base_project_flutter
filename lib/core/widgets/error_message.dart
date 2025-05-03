import 'package:flutter/material.dart';

/// A reusable error message component for displaying errors
/// throughout the app.
class ErrorMessage extends StatelessWidget {
  /// Creates an error message display with a message and optional retry action
  const ErrorMessage({
    super.key,
    required this.message,
    this.onRetry,
    this.retryText = 'Try Again',
    this.icon = Icons.error_outline,
    this.iconColor,
    this.padding = const EdgeInsets.all(16.0),
  });

  /// The error message to display
  final String message;

  /// Optional callback function when retry button is pressed
  final VoidCallback? onRetry;

  /// Text to display on the retry button
  final String retryText;

  /// Icon to display above the error message
  final IconData icon;

  /// Color of the error icon, defaults to theme's error color
  final Color? iconColor;

  /// Padding around the error message
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64.0,
              color: iconColor ?? Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16.0),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16.0),
              ElevatedButton(onPressed: onRetry, child: Text(retryText)),
            ],
          ],
        ),
      ),
    );
  }
}

/// A fullscreen error message for critical errors
class FullscreenErrorMessage extends StatelessWidget {
  /// Creates a fullscreen error display
  const FullscreenErrorMessage({
    super.key,
    required this.message,
    this.onRetry,
    this.retryText = 'Try Again',
  });

  /// The error message to display
  final String message;

  /// Optional callback function when retry button is pressed
  final VoidCallback? onRetry;

  /// Text to display on the retry button
  final String retryText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorMessage(
        message: message,
        onRetry: onRetry,
        retryText: retryText,
      ),
    );
  }
}
