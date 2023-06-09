

import 'package:firebase_auth/firebase_auth.dart';
import 'package:speak/core/auth/constants/constants.dart';
import 'package:speak/core/auth/models/auth_reult_enum.dart';
import 'package:speak/core/util/extensions/ext.dart';

class AuthActions {
  const AuthActions();

  String? get userId => FirebaseAuth.instance.currentUser?.uid;
  // final actionCodeSettings = ActionCodeSettings(url: url);


  Future<AuthResult> forgotPassWord({
    required String email
  }) async {
    try {
      // check if user exists
    
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        return AuthResult.success;

    } on FirebaseAuthException catch (e) {
       if (e.code == Constants.userDoesNotExist) {
        e.log();
        return AuthResult.failure;
       } 
       return AuthResult.success;
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