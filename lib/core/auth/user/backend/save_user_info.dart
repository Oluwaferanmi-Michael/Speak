import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:speak/core/util/constants/firebase_collection_names.dart';
import 'package:speak/core/util/constants/firebase_field_names.dart';

import '../models/user_model_payload.dart';

@immutable
class SaveUserInfo {
  const SaveUserInfo();


  Future<bool> saveUserInfo({
    required String userId,
    required String displayName,
    required String email,
    required String password
  }) async {
    try {
      // check if user exists
      final user = await FirebaseFirestore.instance.collection(
        FirebaseCollectionName.users
      ).where(
        FirebaseFieldName.userId, isEqualTo: userId
      ).limit(1).get();


      // if yes: update user
      if (user.docs.isNotEmpty) {
        user.docs.first.reference.update({
          FirebaseFieldName.displayName : displayName,
          FirebaseFieldName.email : email
        });
        return true;
      }


      final payLoad = UserInfoModelPayload(userId: userId, displayName: displayName, email: email);

      // if no create new user
      await FirebaseFirestore.instance.collection(
        FirebaseCollectionName.users
        ).add(
          payLoad
        );
        return true;
    } catch (e) {
      return false;
    }
  }
}