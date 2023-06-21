import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';
import 'package:speak/core/draw/providers/draw_provider.dart';

class Draw extends ConsumerWidget {
  const Draw({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Scribble(
        notifier: ref.watch(drawProvider.notifier)
      )
    );
  }
}