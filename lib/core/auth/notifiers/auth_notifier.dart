

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/auth/backend/auth.dart';
import 'package:speak/core/auth/models/auth_state.dart';
import 'package:speak/core/auth/user/backend/save_user_info.dart';

import '../../models/typdefs/typedefs.dart';
import '../models/auth_reult_enum.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(): super( const AuthState.unknown()) {
    if(_authenticator.isLoggedIn){
      state = AuthState(authResult: AuthResult.success, isLoading: false, userId: _authenticator.userId);
    }
  }

  
  final _authenticator = const Authenticator();
  final _saveUserInfo = const SaveUserInfo();

  // Implement logOut function
  Future<void> logOut() async {
    state = state.copyWithIsLoading(isLoading: true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  // Implement createUser function
  Future<void> createUser({
    required String email,
    required String password
  }) async {
      state = state.copyWithIsLoading(isLoading: true);

      final result = await _authenticator.createUserWithEmailAndPassword(email: email, password: password);
      final userId = _authenticator.userId;

      if (result == AuthResult.success && userId != null){
        saveUserInfo(userId: userId, password: password);
      }

      final future = AuthState(authResult: AuthResult.success, isLoading: false, userId: userId);

      state = future;
  }

  // implement signIn function
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWithIsLoading(isLoading: true);

    final result = await _authenticator.signInWithEmailAndPassword(email: email, password: password);
    final userId = _authenticator.userId;

    if (result == AuthResult.success && userId != null){
      saveUserInfo(userId: userId);
    } else if (result == AuthResult.failure) {
      return;
    }

    final future = AuthState(authResult: AuthResult.success, isLoading: false, userId: userId);

    state = future;

    }
  

  Future<void> signInWithGoogle() async {
    state = state.copyWithIsLoading(isLoading: true);

    final result = await _authenticator.signUpWithGoogle();
    final userId = _authenticator.userId;

    if (result == AuthResult.success && userId != null) {
      saveUserInfo(userId: userId);
    }

    final future = AuthState(authResult: AuthResult.success, isLoading: false, userId: userId);

    state = future;
  }



  Future<void> saveUserInfo({
    required UserId userId,
    String? password
  }) => _saveUserInfo.saveUserInfo(
    userId: userId,
    displayName: _authenticator.displayName,
    email: _authenticator.email!,
    password: password ?? ''
  );
}