
import 'speech_keys.dart';

class GeneratedSpeechModel {
  final String id;
  final String status;
  final String url;
  final int? jobTime;
  final String? error;
  final int? eta;

  GeneratedSpeechModel({
    required this.id,
    required this.status,
    required this.url,
    required this.jobTime,
    required this.error,
    this.eta
  });
  
  //  : super ({
  //   SpeechKeys.id : id,  
  //   SpeechKeys.status : status,
  //   SpeechKeys.url : url,  
  //   SpeechKeys.jobTime : jobTime,
  //   SpeechKeys.error : error,
  //   });


    GeneratedSpeechModel.fromJson({
      required Map<String, dynamic> json 
    }) : 
      id = json[SpeechKeys.id],
      error = json[SpeechKeys.error] ?? '',
      eta = json[SpeechKeys.eta] ?? '',
      status = json[SpeechKeys.status],
      jobTime = json[SpeechKeys.jobTime] ?? '',
      url = json[SpeechKeys.url];

    @override
    bool operator ==(covariant GeneratedSpeechModel other) => 
      identical(this, other) ||
      id == other.id &&
      error == other.error &&
      status == other.status &&
      jobTime == other.jobTime &&
      url == other.url;
      
        @override
        int get hashCode => Object.hashAll(
          [
            id,
            error,
            status,
            jobTime,
            url
          ]
        );
      
}