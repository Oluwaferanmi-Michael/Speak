


import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:speak/core/cards/models/cards_key.dart';
import 'package:speak/core/models/enums.dart';
import 'package:speak/core/models/typedefs/typedefs.dart';

@immutable
class CustomCardPayload extends MapView<String, dynamic>{
  CustomCardPayload({
    required UserId createdBy,
    required CardId cardId,
    required String text,
  }) : super({
    CardKey.createdBy: createdBy,
    CardKey.cardId: cardId,
    CardKey.createdAt: FieldValue.serverTimestamp(),
    CardKey.category: CardCategory.customCard
  });

}