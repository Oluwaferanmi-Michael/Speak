

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/cards/models/cards_payload.dart';
import 'package:speak/core/models/typedefs/typedefs.dart';
import 'package:speak/core/util/constants/firebase_collection_names.dart';
import 'package:speak/core/util/constants/firebase_field_names.dart';
import 'package:uuid/uuid.dart';

class CreateCardNotifier extends StateNotifier<IsLoading>{
  CreateCardNotifier() : super(false);

  set isLoading(bool value) => state = value;


  Future<void> create({
    required UserId userId,
    required String text,
    String? image,
  }) async {
    isLoading = true;

    // check if card already exists
    final card = await FirebaseFirestore.instance.collection(FirebaseCollectionName.cards)
    .where(
      FirebaseFieldName.userId, isEqualTo: userId
    ).limit(1).get();

    // update if exists
    if (card.docs.isNotEmpty) {
      card.docs.first.reference.update({
        FirebaseFieldName.text : text
      });
    }

    final payload = CardsPayload(
      text: text, image: image ?? '', createdBy: userId
    );

    await FirebaseFirestore.instance.collection(FirebaseFieldName.userId).add(payload);

    isLoading = false;
    return;
  }
}