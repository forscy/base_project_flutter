import 'package:flutter/material.dart';

/// A reusable loading indicator component for displaying loading states
/// throughout the app.
class LoadingIndicator extends StatelessWidget {
  /// Creates a loading indicator with optional size and color
  const LoadingIndicator({
    super.key,
    this.size = 40.0,
    this.color,
    this.padding = const EdgeInsets.all(8.0),
  });

  /// The size of the loading indicator
  final double size;

  /// The color of the loading indicator, defaults to theme's primary color
  final Color? color;

  /// Padding around the loading indicator
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

/// A fullscreen loading indicator that shows a centered loading spinner
class FullscreenLoadingIndicator extends StatelessWidget {
  /// Creates a fullscreen loading indicator
  const FullscreenLoadingIndicator({super.key, this.message});

  /// Optional message to display below the loading spinner
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoadingIndicator(),
            if (message != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  message!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
