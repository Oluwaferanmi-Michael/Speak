import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/models/typdefs/typedefs.dart';
import '../notifier/text_to_speech_notifier.dart';


final textToSpeechProvider = StateNotifierProvider<TextToSpeechNotifier, IsLoading>((ref) {
  return TextToSpeechNotifier();
});