class Habit {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final int streak;
  final int colorCode;
  final String iconId;

  Habit({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.streak,
    required this.colorCode,
    required this.iconId,
  });

  Habit copyWith({
    String? name,
    String? description,
    int? streak,
    int? colorCode,
    String? iconId,
  }) {
    return Habit(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt,
      streak: streak ?? this.streak,
      colorCode: colorCode ?? this.colorCode,
      iconId: iconId ?? this.iconId,
    );
  }

  Habit incrementStreak() => copyWith(streak: streak + 1);
}
