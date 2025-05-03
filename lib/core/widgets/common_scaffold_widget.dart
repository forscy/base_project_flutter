import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonScaffoldWidget extends StatelessWidget {
  const CommonScaffoldWidget({
    super.key,
    this.colorsGradient,
    this.body,
    this.appBar,
    this.title,
    this.bottom,
    this.routeBackButton,
    this.floatingActionButton,
  });

  final List<Color>? colorsGradient;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final String? title;
  final PreferredSizeWidget? bottom;
  final String? routeBackButton;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final defaultColors = [
      Theme.of(context).colorScheme.secondary.withAlpha(50),
      Theme.of(context).colorScheme.tertiary.withAlpha(50),
      Theme.of(context).colorScheme.tertiary.withAlpha(50),
      Theme.of(context).colorScheme.tertiary.withAlpha(50),
      Theme.of(context).colorScheme.secondary.withAlpha(50),
      Theme.of(context).colorScheme.secondary.withAlpha(50),
    ];

    // Gunakan operator ?? yang lebih ringkas untuk nilai default
    final usedColors = colorsGradient ?? defaultColors;

    return Scaffold(
      extendBody: true,
      appBar:
          appBar ??
          AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.2),
                    Theme.of(
                      context,
                    ).colorScheme.tertiary.withValues(alpha: 0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: Text(title ?? ''),
            bottom: bottom,
            leading:
                routeBackButton != null
                    ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // can pop? using go router
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          // or using go router
                          context.push(routeBackButton!);
                        }
                      },
                    )
                    : null,
          ),
      body: Container(
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
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
