
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/auth/models/auth_state.dart';

import '../notifiers/auth_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});