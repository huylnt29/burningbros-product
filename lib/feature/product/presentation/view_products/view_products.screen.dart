import 'package:burningbros_product/core/enumeration/request_state.dart';
import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/extension/widget.dart';
import 'package:burningbros_product/core/generated/assets.gen.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:burningbros_product/core/style/text_style.dart';
import 'package:burningbros_product/core/widget/announcment.dart';
import 'package:burningbros_product/core/widget/list_view.dart';
import 'package:burningbros_product/core/widget/list_view_shimmer.dart';
import 'package:burningbros_product/core/widget/product_card.dart';
import 'package:burningbros_product/core/widget/scaffold.dart';
import 'package:burningbros_product/feature/product/presentation/view_products/bloc/view_products.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewProductsScreen extends StatefulWidget {
  const ViewProductsScreen({super.key});

  @override
  State<ViewProductsScreen> createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  final scrollController = ScrollController();
  late ViewProductsBloc viewProductsBloc;
  @override
  void initState() {
    super.initState();
    viewProductsBloc = context.read<ViewProductsBloc>();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          if (viewProductsBloc.state.paginationMeta!.skip >=
              viewProductsBloc.state.paginationMeta!.total) return;
          viewProductsBloc.add(LoadMore());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: Row(
        children: [
          Text(
            Localization.of(context)!.products,
            style: AppTextStyle.heading3(color: AppColor.primary),
          ),
          const Spacer(),
          IconButton(
            iconSize: 18.sf,
            color: AppColor.primary,
            onPressed: () => {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            iconSize: 18.sf,
            color: AppColor.primary,
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: buildBody(),
      ),
      backgroundColor: AppColor.accent,
      bodyBgColor: AppColor.extremeLightGray,
    );
  }

  Widget buildBody() {
    return BlocBuilder<ViewProductsBloc, ViewProductsState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.initial:
            return const SizedBox.shrink();

          case RequestState.loading:
            return AppListView(
              direction: Axis.vertical,
              seperator: 18.vertical,
              children: [
                ...(state.result ?? []).map((e) => ProductCard(e)),
                ListViewShimmer(
                  itemCount: 7,
                  itemHeight: 27.h,
                ),
              ],
            );

          case RequestState.loaded:
            return Column(
              children: [
                AppListView(
                  direction: Axis.vertical,
                  seperator: 18.vertical,
                  children: state.result!.map((e) => ProductCard(e)).toList(),
                ),
                if (state.paginationMeta!.skip >=
                    state.paginationMeta!.total) ...[
                  18.vertical,
                  Text(
                    Localization.of(context)!.nothingMoreToShow,
                    style: AppTextStyle.text(),
                    textAlign: TextAlign.center,
                  )
                ],
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
