class ImageManager {
  ImageManager._();
  static final ImageManager _instance = ImageManager._();
  factory ImageManager() => _instance;

    final String splashBackground = 'assets/images/splash_background.png';
    final String personMarker = 'assets/images/person_marker.png';
    final String locationDirection = 'assets/images/location_direction.png';
}