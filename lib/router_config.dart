import 'package:base_project_flutter/core/screens/not_found_screen.dart';
import 'package:base_project_flutter/core/screens/unauthorized_screen.dart';
import 'package:base_project_flutter/core/screens/under_maintenance_screen.dart';
import 'package:base_project_flutter/features/auth/auth_provider.dart';
import 'package:base_project_flutter/features/auth/models/user_model.dart';
import 'package:base_project_flutter/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static GoRouter router(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return GoRouter(
      initialLocation: LoginScreen.routeName,
      refreshListenable: authProvider,
      redirect: (context, state) {
        final isLoggedIn = authProvider.isAuthenticated;
        final isGoingToLogin = state.matchedLocation == LoginScreen.routeName;
        // role
        final userRole = authProvider.currentUser?.role;
        // If not logged in and not going to login, redirect to login
        if (!isLoggedIn && !isGoingToLogin) {
          return LoginScreen.routeName;
        }

        // If logged in and going to login, redirect to home
        if (isLoggedIn && isGoingToLogin && userRole == UserRole.admin) {
          return "DashboardScreen.routeName";
        }

        // If logged in and going to login, redirect to home
        if (isLoggedIn && isGoingToLogin) {
          return '';
        }

        // No redirection needed
        return null;
      },
      routes: [
        GoRoute(
          path: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
        // Error handling routes
        GoRoute(
          path: UnauthorizedScreen.routeName,
          builder: (context, state) => const UnauthorizedScreen(),
        ),
        GoRoute(
          path: NotFoundScreen.routeName,
          builder: (context, state) => const NotFoundScreen(),
        ),
        GoRoute(
          path: UnderMaintenanceScreen.routeName,
          builder: (context, state) => const UnderMaintenanceScreen(),
        ),
      ],
      errorBuilder: (context, state) => NotFoundScreen(), // Handle 404 errors
    );
  }
}
