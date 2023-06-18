import 'dart:collection';
import 'package:speak/core/text_to_speech/models/speech_model.dart';

import '../../models/typedefs/typedefs.dart';
import '../../util/constants/firebase_field_names.dart';

class TextSpeechModel extends MapView<String, dynamic>{
  final TextId id;
  final String text;
  final SpeechModel audio;

  TextSpeechModel({
    required this.text,
    required this.id,
    required this.audio
  }) : super ({
    FirebaseFieldName.text : text,
    FirebaseFieldName.textId : id,
    FirebaseFieldName.audio : audio
  });
}