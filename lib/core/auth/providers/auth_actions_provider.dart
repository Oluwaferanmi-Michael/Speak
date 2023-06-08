

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifiers/auth_action_notifier.dart';

final authActionsProvider = StateNotifierProvider<AuthActionsNotifier, bool>((ref) {
  return AuthActionsNotifier();
});