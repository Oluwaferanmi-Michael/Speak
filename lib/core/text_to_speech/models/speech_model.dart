

import 'dart:collection';
import 'dart:io';

import 'package:speak/core/text_to_speech/models/speech_keys.dart';

import '../../models/typedefs/typedefs.dart';

class SpeechModel extends MapView<String, dynamic>{
  
  SpeechModel({
    required File audioFile,
    required String fileName,
    required TextId textId,
  }) : super({
    SpeechKeys.fileName : fileName,
    SpeechKeys.audioFile : audioFile,
    SpeechKeys.textId : textId,    
  });
  
}