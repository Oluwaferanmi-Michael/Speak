

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/Models/enums.dart';
import 'package:speak/core/auth/providers/auth_provider.dart';
import 'package:speak/core/util/widgets.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(
            builder: (context, ref, child) => 
            Button(
              type: ButtonType.icon,
              icon: Icons.logout,
              onTap: () {
                ref.watch(authStateProvider.notifier).logOut();
              },
            ),
            ),
        ],
      ),
      body: const SizedBox(
        child: Text('woooo')),
    );
  }
}