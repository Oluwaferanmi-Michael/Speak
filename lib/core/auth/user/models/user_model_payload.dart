import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:speak/core/models/typdefs/typedefs.dart';
import 'package:speak/core/util/constants/firebase_field_names.dart';

// MapView collection Object helps create the toJson constructor by calling a super class on the UserModel
// toJson constructor to send Data to the BackEnd
@immutable
class UserInfoModelPayload extends MapView<String, String> {

  UserInfoModelPayload({
    required UserId userId,
    required String displayName,
    required String email,
    required String password,
  }) : super({
    FirebaseFieldName.userId : userId,
    FirebaseFieldName.displayName : displayName,
    FirebaseFieldName.email : email,
    FirebaseFieldName.password: password,
  });
}