import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class Card{

  const Card();
  // @override
  // bool operator ==(covariant Card other) =>
  //   identical(this, other) || cardId == other.cardId && 
  //   category == other.category &&
  //   text == other.text &&
  //   createdBy == other.createdBy &&
  //   runtimeType == other.runtimeType;

  // @override
  // int get hashCode => Object.hashAll([
  //   text,
  //   cardId,
  //   category,
  //   createdBy,
  //   runtimeType,
  // ]);

}