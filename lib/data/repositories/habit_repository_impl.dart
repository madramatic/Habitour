import 'package:habitour/data/models/habit_model.dart';
import 'package:habitour/domain/entities/habit.dart';
import 'package:habitour/domain/repositories/habit_repository.dart';

import '../datasources/habit_local_data_source.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDataSource localDataSource;

  HabitRepositoryImpl(this.localDataSource);

  @override
  Future<void> addHabit(Habit habit) async {
    final habitModel = HabitModel.fromEntity(habit);
    await localDataSource.saveHabit(habitModel);
  }

  @override
  Future<void> deleteHabit(String id) async {
    await localDataSource.deleteHabit(id);
  }

  @override
  Future<List<Habit>> getAllHabits() async {
    final models = await localDataSource.getAllHabits();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateHabit(Habit habit) async {
    final model = HabitModel.fromEntity(habit);
    await localDataSource.saveHabit(model);
  }
}
