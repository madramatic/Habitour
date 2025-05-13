import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:habitour/data/datasources/habit_local_data_source_impl.dart';
import 'package:habitour/data/repositories/habit_repository_impl.dart';
import 'package:habitour/data/models/habit_model.dart';

final habitBoxProvider = Provider<Box<HabitModel>>((ref) {
  return Hive.box<HabitModel>('habitBox');
});

final habitLocalDataSourceProvider = Provider<HabitLocalDataSourceImpl>((ref) {
  final habitBox = ref.watch(habitBoxProvider);
  return HabitLocalDataSourceImpl(habitBox);
});

final habitRepositoryProvider = Provider<HabitRepositoryImpl>((ref) {
  final localDataSource = ref.watch(habitLocalDataSourceProvider);
  return HabitRepositoryImpl(localDataSource);
});
