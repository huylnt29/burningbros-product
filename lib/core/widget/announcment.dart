import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Announcement extends StatelessWidget {
  const Announcement({
    required this.message,
    required this.imagePath,
    this.margin,
    super.key,
  });
  final String imagePath;
  final String message;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(12.sf),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FractionallySizedBox(
            widthFactor: 0.75,
            child: SvgPicture.asset(
              imagePath,
              alignment: Alignment.topCenter,
              height: 240.sf,
            ),
          ),
          12.vertical,
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyle.heading3(),
          ),
        ],
      ),
    );
  }
}
