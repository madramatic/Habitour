import 'package:flutter/material.dart';
import 'theme_config.dart';
import 'theme_provider.dart';

/// Public API class with static methods for easy theme access
class AppTheme {
  static ThemeConfigProvider _provider = AppThemeProvider();

  static ThemeData light() => _provider.lightTheme();
  static ThemeData dark() => _provider.darkTheme();

  @visibleForTesting
  static void setThemeProvider(ThemeConfigProvider provider) {
    _provider = provider;
  }
}
