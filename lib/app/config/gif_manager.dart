class GifManager {
  GifManager._();
  static final GifManager _instance = GifManager._();
  factory GifManager() => _instance;
  final String questions = 'assets/gifs/question.gif';
  final String categories = 'assets/gifs/categories.gif';
}
