import 'package:flutter/material.dart';

class AppColor {
  AppColor._internall();

  static const Color text = Color(0xFF1D2D46);
  static const Color primary = Colors.white;

  static const Color secondary = Color.fromARGB(255, 240, 249, 255);
  static const Color secondaryOrange = Color(0xFFFFFAF0);
  static const Color secondaryYellow = Color(0xFFFFFFF0);
  static const Color secondaryPurple = Color(0xFFFAF5FF);
  static const Color secondaryRed = Color(0xFFFFF5F5);
  static const Color secondaryGreen = Color(0xFFF0FFF4);

  static const Color accent = Color.fromRGBO(23, 89, 133, 1);
  static const Color accentGreen = Color(0xFF25855A);
  static const Color accentOrange = Color(0xFFC05621);
  static const Color accentYellow = Color(0xFFB7791F);
  static const Color accentPurple = Color.fromARGB(255, 93, 63, 164);
  static const Color accentRed = Color(0xFFC53030);

  static const Color neutralGray = Color(0xFF616161);
  static const Color lightGray = Color.fromRGBO(97, 97, 97, 0.25);
  static const Color extremeLightGray = Color.fromRGBO(248, 250, 252, 1);

  static const accentGradient = LinearGradient(
    colors: [
      AppColor.accent,
      AppColor.secondary,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
  );
  static const secondaryGradient = RadialGradient(
    center: Alignment(0.1, 0.2),
    radius: 0.9,
    colors: [
      Color.fromRGBO(239, 246, 249, 1),
      Color.fromRGBO(206, 239, 253, 1),
    ],
    stops: [0.0, 0.9],
  );

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static getContrastColor(String hex) {
    final secondary = fromHex(hex);
    switch (secondary) {
      case AppColor.secondary:
        return accent;
      case secondaryGreen:
        return accentGreen;
      case secondaryOrange:
        return accentOrange;
      case secondaryPurple:
        return accentPurple;
      case secondaryYellow:
        return accentYellow;
      case secondaryRed:
        return accentRed;
      default:
        return neutralGray;
    }
  }
}
