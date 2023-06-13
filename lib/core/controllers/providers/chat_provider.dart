import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/chat_message_model.dart';

class ChatNotifier extends StateNotifier<List<ChatMessageModel>>{
  ChatNotifier() : super(<ChatMessageModel>[]);


  void addMessage(ChatMessageModel message){
    // state = state.add(message);
    state = [message, ...state];
  }
}


StateNotifierProvider<ChatNotifier, List<ChatMessageModel>> chatProvider = StateNotifierProvider((ref) => ChatNotifier());
