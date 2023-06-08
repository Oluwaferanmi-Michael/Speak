

import 'package:firebase_auth/firebase_auth.dart';
import 'package:speak/core/auth/constants/constants.dart';
import 'package:speak/core/util/extensions/ext.dart';
import 'package:speak/core/util/strings.dart';

class AuthActions {
  const AuthActions();

  // User? get _user => FirebaseAuth.instance.currentUser;


  Future<String?> forgotPassWord({
    required String email
  }) async {
    try {

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
       return Strings.success;
    } on FirebaseAuthException catch (e) {
       if (e.code == Constants.userDoesNotExist) {
        e.log();
        return Strings.invalidEmail;
       } 
       return Strings.success;
    }
  }


  // Future<void> verifyEmail({
  //   required String email
  // }) async {
  //   try {
  //     await FirebaseAuth.instance.
  //   } catch (e) {
      
  //   }
  // }

}