final class ApiManager {
  final String openAiKey;

  static ApiManager? _instance;
  static var isReady = false;

  ApiManager._internal(this.openAiKey) {
    isReady = true;
  }

  factory ApiManager(String key) {
    _instance ??= ApiManager._internal(key);
    return _instance!;
  }
}
