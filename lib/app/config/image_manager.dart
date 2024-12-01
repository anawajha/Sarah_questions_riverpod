class ImageManager {
  ImageManager._();
  static final ImageManager _instance = ImageManager._();
  factory ImageManager() => _instance;
    final String userPlaceholder = 'assets/images/user_placeholder.png';
    final String logo = 'assets/images/logo.png';
}