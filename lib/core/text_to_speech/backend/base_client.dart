import 'package:http/http.dart' as http;
import 'package:speak/core/text_to_speech/constants/constants.dart';
import 'package:speak/core/text_to_speech/models/text_to_speech_payload.dart';

class TextSpeechBaseClient {
  TextSpeechBaseClient();



  Future<void> convertTextToSpeech({
    required String text
  }) async {

    try {
    final client = http.Client();
    final url = Uri.https(TextSpeechConstants.uri, TextSpeechConstants.service,  TextSpeechConstants.headers);
    final payLoad = TextSpeechPayload(text);
    
    client.post(url, body: payLoad, headers: TextSpeechConstants.headers);
      
    } catch (e) {
      
    }
  }


}