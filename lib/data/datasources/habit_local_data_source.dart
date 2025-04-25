import 'package:habitour/data/models/habit_model.dart';

abstract class HabitLocalDataSource {
  Future<void> addHabit(HabitModel habit);
  Future<void> deleteHabit(String id);
  Future<List<HabitModel>> getAllHabits();
}
