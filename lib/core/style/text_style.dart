import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  const AppTextStyle._internal();

  static double _getLineHeight(
      {required double lineHeight, required double fontSize}) {
    return ((lineHeight * 100) / fontSize) / 100;
  }

  static TextStyle heading1({Color? color}) => TextStyle(
        color: color ?? AppColor.neutralGray,
        fontSize: 21.sf,
        fontWeight: FontWeight.bold,
        height: _getLineHeight(fontSize: 24.sf, lineHeight: 36.sf),
      );

  static TextStyle heading2({Color? color}) => TextStyle(
        color: color ?? AppColor.neutralGray,
        fontSize: 18.sf,
        fontWeight: FontWeight.bold,
        height: _getLineHeight(fontSize: 20.sf, lineHeight: 30.sf),
      );

  static TextStyle heading3({Color? color}) => TextStyle(
        color: color ?? AppColor.neutralGray,
        fontSize: 16.sf,
        fontWeight: FontWeight.bold,
        height: _getLineHeight(fontSize: 18.sf, lineHeight: 24.sf),
      );

  static TextStyle text({Color? color, bool bold = false}) => TextStyle(
        color: color ?? AppColor.text,
        fontSize: 13.sf,
        fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
        height: _getLineHeight(fontSize: 13.sf, lineHeight: 16.sf),
      );

  static TextStyle smallText({Color? color}) => TextStyle(
        color: color ?? AppColor.text,
        fontSize: 12.sf,
        height: _getLineHeight(fontSize: 11.sf, lineHeight: 12.sf),
      );

  static TextStyle custom({
    Color? color,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize ?? 13.sf,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        height: 0,
      );
}

extension TextStyleWithCP on TextStyle {
  TextStyle cp({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    // ui.TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    // List<ui.Shadow>? shadows,
    // List<ui.FontFeature>? fontFeatures,
    // List<ui.FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) =>
      copyWith(
        inherit: inherit,
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height:
            height != null ? height.sf.textHeight(fontSize ?? 14.sf) : height,
        leadingDistribution: leadingDistribution,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        fontVariations: fontVariations,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        debugLabel: debugLabel,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        overflow: overflow,
      );
}

extension SB on num {
  Widget get vertical => SizedBox(
        height: toDouble().sf,
      );
  Widget get horizontal => SizedBox(
        width: toDouble().sf,
      );
  double textHeight(num size) => this / size;
}
