import 'package:flutter/material.dart';

/// Abstract theme interface for dependency inversion and easier theme extensions
abstract class ThemeConfigProvider {
  ThemeData lightTheme();
  ThemeData darkTheme();
}
