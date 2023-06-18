
import '../constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speak/core/auth/models/auth_reult_enum.dart';
import 'package:speak/core/models/typedefs/typedefs.dart';

class Authenticator {
  const Authenticator();

  User? get currentUser => FirebaseAuth.instance.currentUser;

  UserId? get userId => currentUser?.uid;

  bool get isLoggedIn => userId != null;

  String get displayName => currentUser?.displayName ?? '';

  String? get email => currentUser?.email;



  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // sign up with Google
  Future<AuthResult> signUpWithGoogle() async {
    final googleSignIn = GoogleSignIn(
      scopes: [Constants.emailScope]
    );

    final signInAccount = await googleSignIn.signIn();

    if (signInAccount == null) {
      return AuthResult.aborted;
    }

    final googleAuth = await signInAccount.authentication;

    final googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    try {
      FirebaseAuth.instance.signInWithCredential(
        googleAuthCredential
      );
      return AuthResult.success;
    } catch (error) {
      return AuthResult.failure;
    }
  }

  // create user with Email and Password
  Future<AuthResult> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      final email = e.email;
      final credential = e.credential;

      // if account exists with different provider (e.g. Google.com link both)
      if (e.code == Constants.accountExistsWithDifferentCredential &&
          email != null &&
          credential != null) {
            
            // Check what provider does the email contiain
        final provider = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

        if (provider.contains(Constants.googleCom)) {
          await signUpWithGoogle();
          FirebaseAuth.instance.currentUser?.linkWithCredential(credential);          
        }
        return AuthResult.success;  
      }
      return AuthResult.failure;
    } 
  }

  
  // signIn with Email and Password
  Future<AuthResult> signInWithEmailAndPassword({required String email, required String password}) async {
    try {


      // if (user.docs.isNotEmpty){
        final credential = EmailAuthProvider.credential(email: email, password: password);
      await FirebaseAuth.instance.signInWithCredential(credential);
      // }

      return AuthResult.success;
  
    } on FirebaseAuthException catch (error) {

      final email = error.email;
      final credential = error.credential;

      // if account exists with different provider (e.g. Google.com link both)
      if (error.code == Constants.accountExistsWithDifferentCredential &&
          email != null &&
          credential != null) {
            // Check what provider does the email contiain
        final provider = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

        if (provider.contains(Constants.googleCom)) {
          await signUpWithGoogle();
          FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
        }
        return AuthResult.success;

      } else if (error.code == Constants.accountDoesNotExist){
        return AuthResult.failure;
      }
      return AuthResult.failure;     
    }
  }
}