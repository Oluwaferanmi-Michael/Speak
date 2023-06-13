import 'dart:collection';


class TextSpeechPayload extends MapView<String, String>{
  final String text;

  TextSpeechPayload(
    this.text
  ) : super({
    text : text
  });
}