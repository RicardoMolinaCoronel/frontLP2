import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/colors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();
  static ThemeData define() {
    return ThemeData(
      primaryColor: colors.red1,
    );
  }
}
