import '../entities/habit.dart';

abstract class HabitRepository {
  Future<void> addHabit(Habit habit);
  Future<void> updateHabit(Habit habit);
  Future<void> deleteHabit(String id);
  Future<List<Habit>> getAllHabits();
}
