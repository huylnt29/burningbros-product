import 'package:burningbros_product/core/enumeration/request_state.dart';
import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/generated/assets.gen.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:burningbros_product/core/style/text_style.dart';
import 'package:burningbros_product/core/widget/announcment.dart';
import 'package:burningbros_product/core/widget/list_view.dart';
import 'package:burningbros_product/core/widget/list_view_shimmer.dart';
import 'package:burningbros_product/core/widget/product_card.dart';
import 'package:burningbros_product/core/widget/scaffold.dart';
import 'package:burningbros_product/feature/product/presentation/view_favorite_products/bloc/favorite_products.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewFavoriteProductsScreen extends StatefulWidget {
  const ViewFavoriteProductsScreen({super.key});

  @override
  State<ViewFavoriteProductsScreen> createState() =>
      _ViewFavoriteProductsScreenState();
}

class _ViewFavoriteProductsScreenState
    extends State<ViewFavoriteProductsScreen> {
  @override
  void initState() {
    context.read<FavoriteProductsBloc>().add(VisitTheScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: Row(
        children: [
          IconButton(
            iconSize: 18.sf,
            color: AppColor.primary,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          Text(
            Localization.of(context)!.favoriteProducts,
            style: AppTextStyle.heading3(color: AppColor.primary),
          ),
        ],
      ),
      body: buildBody(),
      backgroundColor: AppColor.accent,
      bodyBgColor: AppColor.extremeLightGray,
    );
  }

  Widget buildBody() {
    return BlocBuilder<FavoriteProductsBloc, FavoriteProductsState>(
      builder: (context, state) {
        switch (state.getRequestState) {
          case RequestState.initial:
            return const SizedBox.shrink();

          case RequestState.loading:
            return ListViewShimmer(
              itemCount: 7,
              itemHeight: 27.h,
            );

          case RequestState.loaded:
            if (state.result?.isEmpty ?? true) {
              return Announcement(
                message: Localization.of(context)!.noData,
                imagePath: Assets.image.empty.path,
              );
            }
            return Column(
              children: [
                AppListView(
                  direction: Axis.vertical,
                  seperator: 18.vertical,
                  children: state.result!
                      .map((e) => ProductCard(
                            product: e,
                            isFavorited: true,
                          ))
                      .toList(),
                ),
              ],
            );

          case RequestState.error:
            return Announcement(
              message: Localization.of(context)!.error,
              imagePath: Assets.image.error.path,
            );
        }
      },
    );
  }
}
