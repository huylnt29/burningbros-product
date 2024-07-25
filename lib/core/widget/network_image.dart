import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });
  final String? imageUrl;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12.sf),
      child: (imageUrl != null)
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              width: width,
              height: height,
              color: color,
              fit: fit,
              placeholder: (context, url) => const ColoredBox(
                color: AppColor.extremeLightGray,
              ),
              errorWidget: (context, url, error) => const SizedBox.shrink(),
              memCacheHeight: 300,
              memCacheWidth: 300,
            )
          : Container(
              color: AppColor.lightGray,
              width: width,
              height: height,
            ),
    );
  }
}
