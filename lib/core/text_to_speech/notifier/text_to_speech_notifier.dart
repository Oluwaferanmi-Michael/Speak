
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speak/core/models/typdefs/typedefs.dart';
import 'package:speak/core/text_to_speech/backend/base_client.dart';
import 'package:speak/core/text_to_speech/models/speech_model.dart';
import 'package:speak/core/text_to_speech/models/text_to_speech_model.dart';
import 'package:speak/core/text_to_speech/models/text_to_speech_payload.dart';
import 'package:speak/core/util/constants/firebase_collection_names.dart';
import 'package:uuid/uuid.dart';

class TextToSpeechNotifier extends StateNotifier<IsLoading> {
  TextToSpeechNotifier(): super(false);

  final _api = TextSpeechBaseClient();
  final audioPlayer = AudioPlayer();
  final _dio = Dio();

  final textId = const Uuid().v4();
  

  set isLoading(bool value) => value = state;


  Future<void> convertTextToSpeech({
    required String text
  }) async {
    isLoading = false;

    final id = await _sendTextToService(text: text);

    await Future.delayed(const Duration(seconds: 6));

    final url = await _getTextAudio(id: id);

    final audioFile = await _dio.download(
      url, 
      (await getTemporaryDirectory()).path
    );

    // final audio = await launchUrl(Uri.parse(url));

    final textPayload = TextSpeechModel(text: text, id: textId, audio: audioFile);
    await FirebaseFirestore.instance.collection(FirebaseCollectionName.texts).add(textPayload);

  }


  Future<String> _sendTextToService({
    required String text
  }) async {
    final request = await _api.sendTextData(text: text);
    if (request == null){
      return 'couldn\'t send text request';
    }
    final response = TextToSpeechRequest.fromJson(json: request);

    return response.id;
  }


  Future<String> _getTextAudio({
    required String id
  }) async {
    final request = await _api.getAudioStream(id: id);

    if (request == null){
      return 'couldn\'t generate text request';
    }

    final response = SpeechModel.fromJson(json: request);

    if (response.status == 'processing'){
      return 'processing request please wait ${response.eta}';
    } 
    else if (response.status == 'error'){
      return 'something went wrong please try again';
    }
    else {
      return response.url;
    }

  }


  
}