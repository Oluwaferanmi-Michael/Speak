

import 'dart:collection';

import 'package:speak/core/cards/models/cards_key.dart';
import 'package:speak/core/models/enums.dart';
import 'package:speak/core/models/typedefs/typedefs.dart';

class DefaultCardPayload extends MapView<String, dynamic>{

  DefaultCardPayload({
    required String text,
    required CardId cardId,
    required CardCategory category,
  }) : super({
    CardKey.text : text,
    CardKey.category : CardCategory.defaultCard,
    CardKey.cardId : cardId
  });
 
}