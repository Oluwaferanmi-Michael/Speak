import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/auth/backend/auth_actions.dart';



class AuthActionsNotifier extends StateNotifier<bool> {
  AuthActionsNotifier(): super(false);
  
  final _authAction = const AuthActions();

  Future<void> sendPasswordResetLink({
    required String email
  }) async {
    try {
      _authAction.forgotPassWord(email: email);
      state = true;
    } catch (e) {
      state = false;
    }
  }
}