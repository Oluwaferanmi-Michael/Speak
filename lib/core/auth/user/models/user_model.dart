
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:speak/core/models/typdefs/typedefs.dart';
import 'package:speak/core/util/constants/firebase_field_names.dart';


@immutable
class UserInfoModel extends MapView<String, String>{

  final UserId userId;
  final String displayName;
  final String email;

  UserInfoModel({
    required this.userId,
    required this.displayName,
    required this.email,
  }) : super ({
    FirebaseFieldName.displayName : displayName,
    FirebaseFieldName.email : email,
    FirebaseFieldName.userId : userId,
  });


  // From Json constructor to receive data from the backend
  UserInfoModel.fromJson({
    required Map<String, dynamic> json,
    required UserId userId
  }) : this(
      userId: userId,
      displayName: json[FirebaseFieldName.displayName],
      email: json[FirebaseFieldName.email]);

@override
bool operator ==(covariant UserInfoModel other) => identical(this, other) ||
  runtimeType == other.runtimeType &&
  userId == other.userId &&
  displayName == other.displayName &&
  email == other.email;
  
  @override
  int get hashCode => Object.hashAll([displayName, email, userId]);
  


}