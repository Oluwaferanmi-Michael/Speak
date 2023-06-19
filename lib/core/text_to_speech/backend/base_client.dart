import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speak/core/models/exceptions/exception_model.dart';
import 'package:speak/core/text_to_speech/constants/constants.dart';
import 'package:speak/core/text_to_speech/models/text_to_speech_payload.dart';
import 'package:speak/core/util/extensions/ext.dart';
// import 'package:speak/core/util/extensions/ext.dart';
import 'dart:io';

import '../../models/typedefs/typedefs.dart';


class TextSpeechBaseClient {
  TextSpeechBaseClient();

    final client = http.Client();


  Future<dynamic> sendTextData({
    required String text
  }) async {
    try {
    final url = Uri.https(TextSpeechConstants.uri, TextSpeechConstants.service);
    final payLoad = TextToSpeechPayload(text: text);
    
    final response = await client.post(url, body: jsonEncode(payLoad), headers: TextSpeechConstants.headers);
    response.log();

    return _returnResponse(response);
    
      
    } on SocketException {
      throw const FetchDataException();
    }

  }


  Future<dynamic> getAudioStream({
    required TextId id
  }) async {
    try {
      final url = Uri.https(TextSpeechConstants.uri, TextSpeechConstants.service, id.param);
      final response = await client.get(url, headers: TextSpeechConstants.getHeaders);

      // if (response.statusCode != 200) {
      //   throw const AppExceptions().toString();
        
      // }

      // final jsonResponse = jsonDecode(response.body);
      // print(jsonResponse);

      return _returnResponse(response);
    } on SocketException {
      throw const FetchDataException();
    }
    
  }

  

  dynamic _returnResponse(http.Response response){
       switch(response.statusCode){
        case 200:
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse;

        case 300:
        throw const MultipleResponseValuesException().detail(response);

        case 400:
        case 401:
        throw const BadRequestException().detail(response);

        case 500:
        throw const ServerException().detail(response);
       }
  }


}