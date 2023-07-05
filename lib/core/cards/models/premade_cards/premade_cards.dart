
import 'package:speak/core/cards/abstraction/models/abstract_card_model.dart';

class PremadeCards extends Card{
  const PremadeCards({
    required super.text,
    required super.cardId,
    required super.category,
    super.createdBy,
  });
}