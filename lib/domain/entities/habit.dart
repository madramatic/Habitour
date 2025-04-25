class Habit {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final int streak;
  final int colorCode;

  Habit({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.streak,
    required this.colorCode,
  });

  Habit incrementStreak() {
    return Habit(
      id: id,
      name: name,
      createdAt: createdAt,
      streak: streak + 1,
      colorCode: colorCode,
    );
  }
}
