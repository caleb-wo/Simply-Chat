import 'dart:io';

import 'package:openai_dart/openai_dart.dart';

final class ApiManager {
  String openAiKey;
  late OpenAIClient _client;

  static ApiManager? _instance;
  static var _isReady = false;

  ApiManager._internal(this.openAiKey) {
    _isReady = true;
    _updateClient(openAiKey);
  }

  factory ApiManager(String key) {
    if (_instance == null) {
      _instance = ApiManager._internal(key);
    } else {
      _instance!.openAiKey = key;
      _instance!._updateClient(key);
    }

    return _instance!;
  }

  void _updateClient(String apiKey) {
    _client = OpenAIClient(
      config: OpenAIConfig(authProvider: ApiKeyProvider(apiKey)),
    );
  }

  Future<({bool didSucceed, String? reply})> message(String message) async {
    try {
      final resp = await _client.responses.create(
        CreateResponseRequest(
          model: 'gpt-5.4-nano',
          input: ResponseInput.text(message),
        ),
      );

      return (didSucceed: true, reply: resp.outputText);
    } catch (e) {
      print('[Error] $e');
      return (didSucceed: false, reply: null);
    }
  }
}
