import 'package:flutter/material.dart';

/// Enum representing the available icons for the icon picker.
enum HabitIcon {
  home,
  star,
  favorite,
  work,
  school,
  fitness,
  meditation,
  reading,
  cooking,
  travel,
  music,
  exercise,
  writing,
  gardening,
  shopping,
  cleaning,
  sleeping,
  health,
  study,
  social,
}

/// Extension to map HabitIcon to IconData.
extension HabitIconExtension on HabitIcon {
  IconData get iconData {
    switch (this) {
      case HabitIcon.home:
        return Icons.home;
      case HabitIcon.star:
        return Icons.star;
      case HabitIcon.favorite:
        return Icons.favorite;
      case HabitIcon.work:
        return Icons.work;
      case HabitIcon.school:
        return Icons.school;
      case HabitIcon.fitness:
        return Icons.fitness_center;
      case HabitIcon.meditation:
        return Icons.self_improvement;
      case HabitIcon.reading:
        return Icons.menu_book;
      case HabitIcon.cooking:
        return Icons.restaurant;
      case HabitIcon.travel:
        return Icons.flight;
      case HabitIcon.music:
        return Icons.music_note;
      case HabitIcon.exercise:
        return Icons.directions_run;
      case HabitIcon.writing:
        return Icons.edit;
      case HabitIcon.gardening:
        return Icons.grass;
      case HabitIcon.shopping:
        return Icons.shopping_cart;
      case HabitIcon.cleaning:
        return Icons.cleaning_services;
      case HabitIcon.sleeping:
        return Icons.bedtime;
      case HabitIcon.health:
        return Icons.health_and_safety;
      case HabitIcon.study:
        return Icons.school;
      case HabitIcon.social:
        return Icons.people;
    }
  }
}
