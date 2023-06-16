import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../text_to_speech/providers/text_to_speech_provider.dart';
import '../../auth/providers/auth_provider.dart';

final isLoadingProvider = Provider((ref) {
  final authState = ref.read(authStateProvider);
  // final textToSpeechState = ref.read(textToSpeechProvider);
  
  return authState;
});