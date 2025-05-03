import 'package:base_project_flutter/features/auth/models/user_model.dart';

class LoginResponse {
  final bool success;
  final String? token;
  final String? message;
  final UserModel? user;

  LoginResponse({required this.success, this.token, this.message, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      token: json['token'],
      message: json['message'],
      user:
          json['user'] != null
              ? _mapToUserModel(json['user'], json['token'])
              : null,
    );
  }

  factory LoginResponse.error(String message) {
    return LoginResponse(success: false, message: message);
  }

  // Helper method to convert API response to UserModel
  static UserModel _mapToUserModel(Map<String, dynamic> json, String? token) {
    return UserModel(
      id: json['id'] as int,
      nama: json['name'] ?? json['nama'] ?? '',
      email: json['email'] ?? '',
      agama: json['agama'] ?? '',
      role: _parseRole(json['role'] ?? ''),
      token: token,
      // Optional fields
      noTelp: json['noTelp'] ?? json['phone'] ?? json['phone_number'],
      fotoUrl: json['fotoUrl'] ?? json['photo_url'] ?? json['avatar'],
      password: null, // We don't receive password in login response
    );
  }

  static UserRole _parseRole(String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'mahasiswa':
        return UserRole.mahasiswa;
      case 'panitia':
        return UserRole.panitia;
      case 'dosen':
        return UserRole.dosen;
      default:
        throw ArgumentError('Invalid role: $role');
    }
  }
}
