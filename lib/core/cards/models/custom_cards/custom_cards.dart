import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:speak/core/models/typedefs/typedefs.dart';
import 'package:flutter/foundation.dart' show immutable;
import '../cards_key.dart';

import '../../abstraction/models/abstract_card_model.dart';

@immutable
class CustomCards extends Card {
  final CardId cardId;
  final UserId userId;
  final String text;
  final DateTime createdAt;


  CustomCards.fromJson({
    required Map<String, dynamic> json,
    required this.cardId,
  }) : userId = json[CardKey.userId],
       text = json[CardKey.text],
       createdAt = (json[CardKey.createdAt] as Timestamp).toDate();
}

// The Ability to Create cards 
// Save to Firebase Storage

