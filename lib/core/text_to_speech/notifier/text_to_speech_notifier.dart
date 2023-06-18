import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speak/core/text_to_speech/backend/base_client.dart';
import 'package:speak/core/text_to_speech/constants/api_status_strings.dart';
import 'package:speak/core/text_to_speech/models/generated_speech_model.dart';
import 'package:speak/core/text_to_speech/models/text_to_speech_payload.dart';
import 'package:uuid/uuid.dart';

import '../../models/typedefs/typedefs.dart';

class TextToSpeechNotifier extends StateNotifier<IsLoading> {
  TextToSpeechNotifier(): super(false);

  final _api = TextSpeechBaseClient();
  final audioPlayer = AudioPlayer();

  final textId = const Uuid().v4();

  final player = AudioPlayer();
  

  set isLoading(bool value) => value = state;


  Future<void> convertTextToSpeech({
    required String text
  }) async {
    isLoading = true;

    final id = await _sendTextToService(text: text);

    final url = await _getTextAudio(id: id);

    if (!url.contains('https')){
      return;
    }

    final audio = await _fetchAudioFromFiles(url: url, fileName: text);

    player.play(UrlSource(audio));

    isLoading = false;
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
    var request = await _api.getAudioStream(id: id);

    if (request == null){
      return 'couldn\'t generate text request';
    }

    var response = GeneratedSpeechModel.fromJson(json: request);

    if (response.status == Status.processing){
      await Future.delayed(Duration(seconds: response.eta ?? 0));
      request = await _api.getAudioStream(id: id);
      response = GeneratedSpeechModel.fromJson(json: request);
      return response.url;
    } 
    else if (response.status == Status.error){
      return 'something went wrong please try again';
    }
    else {
      return response.url;
    }

  }

  Future<String> _fetchAudioFromFiles({
    required String url,
    required String fileName
    }
  ) async {

    final dio = Dio();

    final savePath = await getTemporaryDirectory();

    dio.downloadUri(
      Uri.parse(url),
      '${savePath.path} $fileName.wav'
    );

    final audioFile = '${savePath.path}/$fileName.wav';

    return audioFile;
  }


  
}