

import 'package:flutter/material.dart';

import '../../../core/util/strings.dart';

class IntroScreenConstants{

  static const titles = [
    Strings.chat,
    Strings.cards,
    Strings.draw,
    Strings.speechToText, 
    // Strings.textToSpeech,
  ];
  static const subtitles = [
    Strings.talkWithAChatFormat,
    Strings.communicateWithCards,
    Strings.drawWhatYouMean,
    Strings.speechTranslatedToText,  
    // Strings.speakByDevice,
  ];
  static const icons = [
    Icon(Icons.chat_bubble_outline),
    Icon(Icons.extension_outlined),
    Icon(Icons.change_history_outlined),
    Icon(Icons.play_arrow_outlined), 
    // Icon(Icons.volume_up_outlined),
  ];
  const IntroScreenConstants._();
}