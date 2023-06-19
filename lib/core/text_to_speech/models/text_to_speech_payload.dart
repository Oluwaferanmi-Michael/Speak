import 'dart:collection';

import 'package:speak/core/text_to_speech/models/speech_keys.dart';

import '../../models/typedefs/typedefs.dart';




class TextToSpeechPayload extends MapView<String, String>{
  final String text;
  TextToSpeechPayload({
    required this.text
  }) : super({
    SpeechKeys.text : text
  });
}

class TextToSpeechRequest{
  final int eta;
  final TextId id;

  TextToSpeechRequest.fromJson({
    required Map<String, dynamic> json
  }) : 
    id = json[SpeechKeys.id],
    eta = json[SpeechKeys.eta];
}