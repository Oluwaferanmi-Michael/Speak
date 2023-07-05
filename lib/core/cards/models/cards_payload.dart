import 'package:flutter/foundation.dart';
import 'package:speak/core/cards/models/cards_key.dart';
import 'package:speak/core/models/typedefs/typedefs.dart';
import 'dart:collection';

@immutable
class CardsPayload extends MapView<String, String> {

  CardsPayload({
    required String text,
    required String image,
    required UserId createdBy,
  }) : super({
    CardKey.text : text,
    CardKey.image : image,
    CardKey.createdBy : createdBy,
  });



}