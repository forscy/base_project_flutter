import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProtectedGoRoute extends GoRoute {
  final List<String> allowedRoles;
  final List<String>? allowedSubRoles; // Tambahkan allowedSubRoles
  final Future<Map<String, String?>> Function() getUserRoleAndSubRole;

  ProtectedGoRoute({
    required super.path,
    required Widget Function(BuildContext, GoRouterState) builder,
    required this.allowedRoles,
    this.allowedSubRoles, // Subrole opsional
    required this.getUserRoleAndSubRole,
    List<GoRoute>? routes,
    super.name,
    super.parentNavigatorKey,
  }) : super(
          builder: (context, state) => builder(context, state),
          routes: routes ?? const [],
          redirect: (context, state) async {
            final userRoleAndSubRole = await getUserRoleAndSubRole();
            final userRole = userRoleAndSubRole['role'];
            final userSubRole = userRoleAndSubRole['subRole'];

            // Periksa role
            if (userRole == null || !allowedRoles.contains(userRole)) {
              return '/unauthorized'; // Redirect ke halaman unauthorized
            }

            // Periksa subrole jika allowedSubRoles disediakan
            if (allowedSubRoles != null &&
                (userSubRole == null || !allowedSubRoles.contains(userSubRole))) {
              return '/unauthorized'; // Redirect ke halaman unauthorized
            }

            return null; // Izinkan akses
          },
        );
}