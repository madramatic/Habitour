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

  Habit copyWith({
    String? name,
    String? description,
    int? streak,
    int? colorCode,
  }) {
    return Habit(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt,
      streak: streak ?? this.streak,
      colorCode: colorCode ?? this.colorCode,
    );
  }

  Habit incrementStreak() => copyWith(streak: streak + 1);
}
