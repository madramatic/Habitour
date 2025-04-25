import 'package:habitour/domain/entities/habit.dart';
import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final DateTime createdAt;

  @HiveField(4)
  final int streak;

  @HiveField(5)
  final int colorCode;

  HabitModel({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.streak,
    required this.colorCode,
  });

  Habit toEntity() {
    return Habit(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt,
      streak: streak,
      colorCode: colorCode,
    );
  }

  factory HabitModel.fromEntity(Habit habit) {
    return HabitModel(
      id: habit.id,
      name: habit.name,
      description: habit.description,
      createdAt: habit.createdAt,
      streak: habit.streak,
      colorCode: habit.colorCode,
    );
  }
}
