import 'package:habitour/data/datasources/habit_local_data_source.dart';
import 'package:habitour/data/models/habit_model.dart';
import 'package:hive/hive.dart';

class HabitLocalDataSourceImpl implements HabitLocalDataSource {
  final Box<HabitModel> _habitBox;

  HabitLocalDataSourceImpl(this._habitBox);

  @override
  Future<void> addHabit(HabitModel habit) async {
    return _habitBox.put(habit.id, habit);
  }

  @override
  Future<void> deleteHabit(String id) async {
    return _habitBox.delete(id);
  }

  @override
  Future<List<HabitModel>> getAllHabits() async {
    return _habitBox.values.toList();
  }
}
