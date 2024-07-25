import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.backgroundGradient,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.borderColor,
    this.onTap,
    this.backgroundColor = AppColor.secondary,
  });
  final Widget child;
  final Color backgroundColor;
  final Gradient? backgroundGradient;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Color? borderColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: backgroundGradient,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(18.sf),
          boxShadow: [
            BoxShadow(
              color: AppColor.lightGray,
              spreadRadius: -5.sf,
              blurRadius: 10.sf,
              offset: Offset(10.sf, 0),
            )
          ],
        ),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: 3.sf,
                horizontal: 12.sf,
              ),
          child: child,
        ),
      ),
    );
  }
}
