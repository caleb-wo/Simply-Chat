final class ApiManager {
  final String openAiKey;
  
  static ApiManager? _instance;

  ApiManager._internal(this.openAiKey);

  factory ApiManager(String key) {
    _instance ??= ApiManager._internal(key);
    return _instance!;
  }
}
