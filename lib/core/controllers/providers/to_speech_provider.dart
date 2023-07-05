import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:speak/core/util/extensions/ext.dart';

import '../../text_to_speech/providers/text_to_speech_provider.dart';


final toSpeechProvider = FutureProvider.family.autoDispose<void, String>((ref, String text) async {

  final path = await ref.watch(textToSpeechProvider.notifier).convertTextToSpeech(text: text);

  final player = AudioPlayer();
  
  await player.setVolume(1.0);
  
  try {
  await player.play(DeviceFileSource(path));
  } on PlatformException catch (e) {
    e.log();
    return;
  }

  // ref.onDispose(() async {
  //   await player.dispose();
  // });

  return;
});