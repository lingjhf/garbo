import 'package:flutter/material.dart';

class GarboTheme extends ThemeExtension<GarboTheme> {
  const GarboTheme({required this.backgroundColor});

  final Color backgroundColor;

  @override
  ThemeExtension<GarboTheme> lerp(
      covariant ThemeExtension<GarboTheme>? other, double t) {
    if (other is! GarboTheme) {
      return this;
    }

    return GarboTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  ThemeExtension<GarboTheme> copyWith({Color? backgroundColor}) =>
      GarboTheme(backgroundColor: backgroundColor ?? this.backgroundColor);
}
