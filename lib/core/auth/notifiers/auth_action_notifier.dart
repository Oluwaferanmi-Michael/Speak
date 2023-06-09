import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/auth/backend/auth_actions.dart';



class AuthActionsNotifier extends StateNotifier<bool> {
  AuthActionsNotifier(): super(false);
  
  final _authAction = const AuthActions();

  Future<bool> sendPasswordResetLink({
    required String email
  }) async {
    try {
      _authAction.forgotPassWord(email: email);
      state = true;
      return state;
    } catch (e) {
      state = false;
      return state;
    }
  }
}