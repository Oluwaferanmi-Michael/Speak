import 'package:flutter/foundation.dart' show immutable;
import 'package:speak/core/models/typedefs/typedefs.dart';
import '../../../models/enums.dart';

@immutable
abstract class Card{
  final String text;
  final CardId cardId;
  final CardCategory? category;
  final UserId? createdBy;

  const Card({
    required this.text,
    required this.cardId,
    required this.category,
    this.createdBy,
  });


  @override
  bool operator ==(covariant Card other) =>
    identical(this, other) || cardId == other.cardId && 
    category == other.category &&
    text == other.text &&
    createdBy == other.createdBy;

  @override
  int get hashCode => Object.hashAll([
    text,
    cardId,
    category,
    createdBy,
  ]);

}