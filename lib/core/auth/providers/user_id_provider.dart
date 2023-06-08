

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/auth/providers/auth_provider.dart';

final userIdProvider = Provider((ref) =>
  ref.watch(authStateProvider).userId
);