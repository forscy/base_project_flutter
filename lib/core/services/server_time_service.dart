import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServerTimeService {
  final Dio _dio;
  DateTime? _serverTime;
  Duration? _offset;

  ServerTimeService({Dio? dio}) : _dio = dio ?? Dio();

  // Simulasi get server time belum ada api nya
  Future<DateTime> getServerTimeSimulation() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));

    // Simulate server time
    _serverTime = DateTime.now(); // WIB

    return _serverTime!;
  }

  // Fetch server time from API
  Future<DateTime> getServerTime() async {
    if (_serverTime != null && _offset != null) {
      // Return cached time plus elapsed time since last sync
      return _serverTime!.add(DateTime.now().difference(_serverTime!));
    }

    try {
      final response = await _dio.get('https://worldtimeapi.org/api/ip');

      if (response.statusCode == 200) {
        final data = response.data;
        _serverTime = DateTime.parse(data['datetime']);
        _offset = _serverTime!.difference(DateTime.now());
        return _serverTime!;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: 'time'),
          message: 'Failed to fetch server time',
        );
      }
    } catch (e) {
      if (e is DioException) {
        debugPrint('Network error: ${e.message}');
        // Fallback if needed
        return DateTime.now();
      }
      rethrow;
    }
  }

  // Get current time with server offset applied
  DateTime getNow() {
    if (_offset == null) return DateTime.now(); // Fallback
    return DateTime.now().add(_offset!);
  }

  // Optional: check if time is synced
  bool get isTimeSynced => _offset != null;
}
