
import 'package:flutter/foundation.dart';

import '../../abstraction/models/abstract_card_model.dart';

@immutable
class CardPacks {
  final List<Card> cardPack;

  const CardPacks({
    required this.cardPack
  });
}