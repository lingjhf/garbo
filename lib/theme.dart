import 'package:flutter/material.dart';

class GarboTheme extends ThemeExtension<GarboTheme> {
  GarboTheme({
    Color? textColor,
    Color? textColor2,
    Color? textSelectedColor,
    Color? navigationBarBackgroundColor,
    Color? pageBackgroundColor,
    Color? textButtonOverlayColor,
  })  : textColor = textColor ?? const Color(0xff7d858e),
        textColor2 = textColor2 ?? const Color(0xffc2cad1),
        textSelectedColor = textSelectedColor ?? const Color(0xff8c78e6),
        navigationBarBackgroundColor =
            navigationBarBackgroundColor ?? const Color(0xff22232e),
        pageBackgroundColor = pageBackgroundColor ?? const Color(0xff191a23),
        textButtonOverlayColor =
            textButtonOverlayColor ?? const Color(0x0affffff);

  //全局字体和图标默认颜色
  final Color textColor;

  //字体和图标2级颜色
  final Color textColor2;

  //全局字体和图标选中颜色
  final Color textSelectedColor;

  //导航栏背景颜色
  final Color navigationBarBackgroundColor;

  final Color textButtonOverlayColor;

  //页面背景颜色
  final Color pageBackgroundColor;

  @override
  ThemeExtension<GarboTheme> lerp(
      covariant ThemeExtension<GarboTheme>? other, double t) {
    if (other is! GarboTheme) {
      return this;
    }

    return GarboTheme(
      textColor: Color.lerp(textColor, other.textColor, t),
      textColor2: Color.lerp(textColor2, other.textColor2, t),
      textSelectedColor:
          Color.lerp(textSelectedColor, other.textSelectedColor, t),
      navigationBarBackgroundColor: Color.lerp(
          navigationBarBackgroundColor, other.navigationBarBackgroundColor, t),
      pageBackgroundColor:
          Color.lerp(pageBackgroundColor, other.pageBackgroundColor, t),
      textButtonOverlayColor:
          Color.lerp(textButtonOverlayColor, other.textButtonOverlayColor, t),
    );
  }

  @override
  ThemeExtension<GarboTheme> copyWith({
    Color? textColor,
    Color? textColor2,
    Color? textSelectedColor,
    Color? navigationBarBackgroundColor,
    Color? pageBackgroundColor,
  }) =>
      GarboTheme(
        textColor: textColor ?? this.textColor,
        textColor2: textColor2 ?? this.textColor2,
        textSelectedColor: textSelectedColor ?? this.textSelectedColor,
        navigationBarBackgroundColor:
            navigationBarBackgroundColor ?? this.navigationBarBackgroundColor,
        pageBackgroundColor: pageBackgroundColor ?? this.pageBackgroundColor,
      );
}
