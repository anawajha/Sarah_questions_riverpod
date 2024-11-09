class AppConfig {
  static final AppConfig instance = AppConfig._internal();
  factory AppConfig() => instance;
  AppConfig._internal();

  final bool _isDev = true;

  String getApiBaseUrl() {
    switch (_isDev) {
      case true:
        return 'https://eduhubplatform.com/api/driver/';
      case false:
        return 'https://eduhubplatform.com/api/driver/';
      default:
        return 'https://eduhubplatform.com/api/driver/';
    }
  }

  String getOneSignalAppId() {
    return 'e9c3da05-1fc6-451b-8511-95c56955e33f';
  }
}
