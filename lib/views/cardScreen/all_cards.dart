import 'package:flutter/material.dart%20';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class AllCardsPage extends HookConsumerWidget {
  const AllCardsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox(
      child: Center(child: Text('all cards'),),
    );
  }
}