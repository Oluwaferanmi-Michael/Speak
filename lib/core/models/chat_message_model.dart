import 'enums.dart';

class ChatMessageModel{
  final String message;
  final MessageType messageType;
  final DateTime timeSent;

  ChatMessageModel({
    required this.message,
    required this.messageType,
    required this.timeSent
  });

}


