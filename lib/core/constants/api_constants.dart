class ApiConstants {
  // Android emulator: 10.0.2.2
  // Real device: use computer's LAN IP (e.g., 192.168.1.18)
  // static const String baseUrl = 'http://124.222.255.137:12233';
  static const String baseUrl = 'https://newsnow.busiyi.world';
  // static const String baseUrl = 'http://192.168.1.18:12233';
  // static const String baseUrl = 'http://10.0.2.2:12233';

  static const String source = '/api/s';
  static const String sourceEntire = '/api/s/entire';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
