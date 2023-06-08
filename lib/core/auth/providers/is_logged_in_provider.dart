import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/auth/models/auth_reult_enum.dart';
import 'package:speak/core/auth/providers/auth_provider.dart';


final isLoggedInProvider = Provider((ref) {
  final authresult = ref.watch(authStateProvider);
  return authresult.authResult == AuthResult.success;
});