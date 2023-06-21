import 'package:flutter/material.dart%20';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/auth/providers/is_logged_in_provider.dart';
import 'package:speak/views/auth/sign_up.dart';

import '../introScreen/intro_screen.dart';

class InitialAuthPage extends ConsumerWidget {
  const InitialAuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);

    if (isLoggedIn == false) {
      return const SignUpScreen();
    } else {
      return const IntroScreen();
    }
  }
}