import 'dart:math';

import 'package:flutter/material.dart';

class GradienLayoutWidget extends StatelessWidget {
  const GradienLayoutWidget({super.key, this.colorsGradient, this.child});

  final List<Color>? colorsGradient;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final defaultColors = [
      Theme.of(context).colorScheme.secondary.withAlpha(0),
      Theme.of(context).colorScheme.tertiary.withAlpha(0),
      Theme.of(context).colorScheme.tertiary.withAlpha(0),
      Theme.of(context).colorScheme.tertiary.withAlpha(0),
      Theme.of(context).colorScheme.secondary.withAlpha(0),
      Theme.of(context).colorScheme.secondary.withAlpha(0),
    ];

    // Gunakan operator ?? yang lebih ringkas untuk nilai default
    final usedColors = colorsGradient ?? defaultColors;

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: usedColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: List.generate(
            usedColors.length,
            (_) => (0.3 + Random().nextDouble() * (0.9 - 0.3)),
          ),
        ),
      ),
      child: child,
    );
  }
}
