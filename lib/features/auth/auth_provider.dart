import 'dart:convert';
import 'package:base_project_flutter/features/auth/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  UserModel? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _currentUser != null;

  // Initialize the auth state by checking for stored token
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      final token = await _secureStorage.read(key: 'auth_token');
      if (token != null) {
        final userData = await _secureStorage.read(key: 'user_data');
        if (userData != null) {
          _currentUser = UserModel.fromJson(json.decode(userData));
        }
      }
    } catch (e) {
      _errorMessage = 'Failed to initialize authentication';
      debugPrint(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Login with email and password
  Future<bool> login(String email, String password) async {
    return false;
  }

  // Logout
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _secureStorage.delete(key: 'auth_token');
      await _secureStorage.delete(key: 'user_data');
      _currentUser = null;
    } catch (e) {
      _errorMessage = 'Failed to logout';
      debugPrint(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get user sub role if user is dosen or mahasiswa
  Future<String?> getUserSubRole() async {
    return null;
  }

  // Get the current user's mahasiswa ID
  int? getCurrentMahasiswaId() {
    
    return null;
  }


}
