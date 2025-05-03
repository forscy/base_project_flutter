import 'dart:ui';
import 'package:base_project_flutter/features/settings/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:base_project_flutter/navigation_state.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  final bool hideNavigationBar;

  const ScaffoldWithNavBar({
    super.key,
    required this.child,
    this.hideNavigationBar = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: child,
      bottomNavigationBar:
          hideNavigationBar
              ? null
              : Consumer<NavigationState>(
                builder: (context, appState, _) {
                  // Container luar HANYA untuk margin, tanpa dekorasi
                  return BottomAppBar(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(0),
                    height: 100,
                    elevation: 2,
                    // Beri margin yang lebih besar di sisi kiri, kanan, dan bawah
                    // height: 72,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      // padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.transparent,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              // Kurangi opacity untuk lebih transparan
                              color:
                                  isDarkMode
                                      ? theme.colorScheme.surface.withAlpha(100)
                                      : theme.colorScheme.surface.withAlpha(
                                        120,
                                      ),
                              borderRadius: BorderRadius.circular(24),
                              // Border yang lebih terlihat
                              border: Border.all(
                                width: 1.0,
                                color:
                                    isDarkMode
                                        ? Colors.white.withAlpha(30)
                                        : Colors.white.withAlpha(120),
                              ),
                              // Bayangan untuk efek mengambang
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(
                                    isDarkMode ? 50 : 30,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildNavItem(
                                  context: context,
                                  icon: Icons.home_rounded,
                                  label: 'Home',
                                  isSelected: appState.currentIndex == 0,
                                  onTap: () {
                                    appState.currentIndex = 0;
                                    context.push('HomeView.routeName');
                                  },
                                ),
                                _buildNavItem(
                                  context: context,
                                  icon: Icons.access_time_rounded,
                                  label: 'Kehadiran',
                                  isSelected: appState.currentIndex == 1,
                                  onTap: () {
                                    appState.currentIndex = 1;
                                    context.push('HomeView.routeName');
                                  },
                                ),
                                _buildNavItem(
                                  context: context,
                                  icon: Icons.person_rounded,
                                  label: 'Akun',
                                  isSelected: appState.currentIndex == 2,
                                  onTap: () {
                                    appState.currentIndex = 2;
                                    context.push(SettingsScreen.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    // Warna yang lebih kontras untuk visibilitas
    final color =
        isSelected
            ? theme.primaryColor
            : theme.brightness == Brightness.light
            ? theme.colorScheme.onSurface.withAlpha(180)
            : theme.colorScheme.onSurface.withAlpha(200);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: theme.primaryColor.withAlpha(50),
      highlightColor: theme.primaryColor.withAlpha(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration:
            isSelected
                ? BoxDecoration(
                  color: theme.primaryColor.withAlpha(40),
                  borderRadius: BorderRadius.circular(16),
                )
                : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: isSelected ? 26 : 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: isSelected ? 12 : 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
