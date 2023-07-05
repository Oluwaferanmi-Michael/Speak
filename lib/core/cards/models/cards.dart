import 'package:flutter/foundation.dart';
import 'package:speak/core/cards/models/cards_key.dart';
import 'package:speak/core/models/typedefs/typedefs.dart';


@immutable
class Cards {
  final String text;
  final String image;
  final CardId cardId;
  final UserId createdBy;


  const Cards({
    required this.text,
    required this.image,
    required this.cardId,
    required this.createdBy
  });

  Cards.fromJson({
    required Map<String, dynamic> json
  }) :
    text = json[CardKey.text],
    image = json[CardKey.image],
    cardId = json[CardKey.cardId],
    createdBy = json[CardKey.createdBy];


  @override
  bool operator ==(covariant Cards other) => identical(this, other) ||
    runtimeType == other.runtimeType &&
    text == other.text &&
    image == other.image;
    
      @override
      int get hashCode => Object.hashAll(
        [
          text,
          image,
          runtimeType,
        ]
      );
    
}