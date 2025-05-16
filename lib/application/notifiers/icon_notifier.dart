import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitour/core/models/habit_icon_enum.dart';

class IconNotifier extends StateNotifier<HabitIcon?> {
  IconNotifier() : super(null);

  void selectIcon(HabitIcon? icon) {
    state = icon;
  }
}

final iconNotifierProvider = StateNotifierProvider<IconNotifier, HabitIcon?>(
  (ref) => IconNotifier(),
);
