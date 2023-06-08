import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/providers/auth_provider.dart';

final isLoadingProvider = Provider((ref) {
  final authState = ref.read(authStateProvider);
  
  return authState;
});