class ApiConfig {
  // Base URL untuk API
  static const String baseUrl = 'https://api.simeta-app.com/api/v1';

  // Timeout untuk HTTP requests dalam detik
  static const int connectionTimeout = 30;
  static const int receiveTimeout = 30;

  // Header default untuk request
  static Map<String, String> getHeaders(String? token) {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }
}
