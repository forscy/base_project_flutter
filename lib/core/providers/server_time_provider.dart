import 'package:base_project_flutter/core/services/server_time_service.dart';
import 'package:flutter/material.dart';

class ServerTimeProvider extends ChangeNotifier {
  final ServerTimeService _serverTimeService;
  DateTime? _serverTime;
  Duration? _offset;

  ServerTimeProvider(ServerTimeService serverTimeService)
    : _serverTimeService = serverTimeService;

  DateTime get serverTime => _serverTime ?? DateTime.now();

  Future<void> fetchServerTime() async {
    try {
      _serverTime = await _serverTimeService.getServerTimeSimulation();
      notifyListeners();
    } catch (e) {
      // Handle error
      debugPrint('Error fetching server time: $e');
    }
  }

  DateTime getNow() {
    if (_offset == null) return DateTime.now(); // Fallback
    return DateTime.now().add(_offset!);
  }

  bool get isTimeSynced => _offset != null;
}
