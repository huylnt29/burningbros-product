import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:flutter/material.dart';

extension NumEx on num {
  double height(num size) => sf / size.sf;

  ///Dont need to use .sf, this function will auto apply .sf
  Widget get vSpace => SizedBox(height: sf);

  ///Dont need to use .sf, this function will auto apply .sf
  Widget get hSpace => SizedBox(width: sf);
}

/// without size default [sizeDefault]
extension NumSize on Size {
  double h(Size size) => height / size.height;

  double w(Size size) => width / size.width;

  double f(Size size) =>
      width < height ? width / size.width : height / size.height;
}

class NumContext {
  NumContext(this.numBer, this.numHeight, this.context);
  final double numBer;
  final double numHeight;
  final BuildContext context;
}

extension SizeLayoutContext on BuildContext {
  Size get appSize => MediaQuery.of(this).size;

  EdgeInsets get padding => MediaQuery.of(this).padding;
}
