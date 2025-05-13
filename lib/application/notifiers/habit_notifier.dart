import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitour/core/providers/dependency_providers.dart';
import 'package:habitour/domain/entities/habit.dart';
import 'package:habitour/data/repositories/habit_repository_impl.dart';

class HabitNotifier extends StateNotifier<AsyncValue<List<Habit>>> {
  final HabitRepositoryImpl repository;

  HabitNotifier(this.repository) : super(const AsyncValue.loading()) {
    fetchHabits();
  }

  Future<void> fetchHabits() async {
    try {
      final habits = await repository.getAllHabits();
      state = AsyncValue.data(habits);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> addHabit(Habit habit) async {
    try {
      await repository.addHabit(habit);
      fetchHabits();
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> updateHabit(Habit habit) async {
    try {
      await repository.updateHabit(habit);
      fetchHabits();
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> deleteHabit(String id) async {
    try {
      await repository.deleteHabit(id);
      fetchHabits();
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final habitNotifierProvider =
    StateNotifierProvider<HabitNotifier, AsyncValue<List<Habit>>>((ref) {
  final repository = ref.watch(habitRepositoryProvider);
  return HabitNotifier(repository);
});
