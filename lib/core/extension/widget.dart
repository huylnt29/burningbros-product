import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension WidgetX on Widget {
  Widget wrapWithResponsiveSizer() {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) => this,
    );
  }

  Widget wrapWithExpanded({int? flex}) {
    return Expanded(
      flex: flex ?? 1,
      child: this,
    );
  }

  Widget wrapWithSafeArea() {
    return SafeArea(
      child: this,
    );
  }

  Widget wrapWithSingleChildScrollView() {
    return SingleChildScrollView(
      child: this,
    );
  }
}
