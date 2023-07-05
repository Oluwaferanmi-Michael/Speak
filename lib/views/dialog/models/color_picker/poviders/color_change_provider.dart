

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final colorChangeProvider = StateProvider.family((ref, Color color) {
  return color;
  });