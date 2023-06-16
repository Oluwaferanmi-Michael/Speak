

import 'dart:collection';
import 'dart:io';

import 'package:speak/core/models/typdefs/typedefs.dart';

import '../../util/constants/firebase_field_names.dart';

class TextSpeechModel extends MapView<String, dynamic>{
  final TextId id;
  final String text;
  final File audio;

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