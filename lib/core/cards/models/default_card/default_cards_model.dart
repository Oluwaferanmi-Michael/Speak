
import 'package:flutter/foundation.dart';
import 'package:speak/core/cards/abstraction/models/abstract_card_model.dart';
import 'package:speak/core/cards/models/cards_key.dart';
import 'package:speak/core/models/enums.dart';
import 'package:speak/core/models/typedefs/typedefs.dart';

@immutable
class DefaultCard extends Card{

    final String text;
    final CardCategory category;
    final CardId cardId;

  DefaultCard({
    required this.cardId,
    required Map<String, dynamic> json,
  }) : text = json[CardKey.text],
       category = json[CardKey.category];
}


// Create Premade cards on server
// on App install Download Premades to local storage for access
// Be Awesome 