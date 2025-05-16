import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorNotifier extends StateNotifier<Color?> {
  ColorNotifier() : super(null);

  void selectColor(Color? color) {
    state = color;
  }
}

final colorNotifierProvider = StateNotifierProvider<ColorNotifier, Color?>(
  (ref) => ColorNotifier(),
);
