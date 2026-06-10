import 'package:ai_chat_simple/api.dart';

import 'package:openai_dart/openai_dart.dart';

final class ChatInterfaceViewModel {
  ApiManager _manager;

  ChatInterfaceViewModel(String key) : _manager = ApiManager(key);

  Future<({bool didSucceed, String? reply})> send(String message) async {
    return await _manager.message(message);
  }
}
