import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speak/core/models/exceptions/exception_model.dart';
import 'package:speak/core/text_to_speech/constants/constants.dart';
import 'package:speak/core/text_to_speech/models/text_to_speech_payload.dart';
import 'dart:io';

import '../../models/typdefs/typedefs.dart';

class TextSpeechBaseClient {
  TextSpeechBaseClient();

    final client = http.Client();


  Future<dynamic> sendTextData({
    required String text
  }) async {
    try {
    final url = Uri.https(TextSpeechConstants.uri, TextSpeechConstants.service,  TextSpeechConstants.headers);
    final payLoad = TextToSpeechPayload(text: text);
    
    final response = await client.post(url, body: payLoad, headers: TextSpeechConstants.headers);

    return _returnResponse(response);
      
    } on SocketException {
      throw FetchDataException();
    }

  }


  Future<dynamic> getAudioStream({
    required TextId id
  }) async {
    final url = Uri.https(TextSpeechConstants.uri, '${TextSpeechConstants.service}?id=$id', TextSpeechConstants.headers);
    final response = await client.get(url, headers: TextSpeechConstants.getHeaders);
    _returnResponse(response).toString();
  }

  

  dynamic _returnResponse(http.Response response){
       switch(response.statusCode){
        case 200:
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse;
        case 400:
        case 401:
        return 'error 401';

        case 500:
        return 'error 500';
       }
  }


}