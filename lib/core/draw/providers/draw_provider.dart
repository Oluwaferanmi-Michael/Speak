

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scribble/scribble.dart';

final drawProvider = StateNotifierProvider.autoDispose<ScribbleNotifier, ScribbleState>((ref) {
  return ScribbleNotifier();
});