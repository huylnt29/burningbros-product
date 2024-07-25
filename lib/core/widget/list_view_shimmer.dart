import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:burningbros_product/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({
    super.key,
    this.itemHeight,
    this.itemCount,
  });
  final double? itemHeight;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.sf),
      padding: EdgeInsets.zero,
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 750),
        baseColor: AppColor.neutralGray.withOpacity(0.25),
        highlightColor: AppColor.extremeLightGray,
        direction: ShimmerDirection.ttb,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: itemCount ?? 12,
          itemBuilder: (context, index) => Container(
            height: itemHeight?.sf ?? 24.sf,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.neutralGray,
            ),
          ),
          separatorBuilder: (context, index) => 12.vertical,
        ),
      ),
    );
  }
}
