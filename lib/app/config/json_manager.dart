class JsonManager {
  JsonManager._();
  static final JsonManager _instance = JsonManager._();
  factory JsonManager() => _instance;

    final String mapStyle = 'assets/json/map_style.json';
}