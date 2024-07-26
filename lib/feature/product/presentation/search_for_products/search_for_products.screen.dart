import 'dart:async';

import 'package:burningbros_product/core/enumeration/input_state.dart';
import 'package:burningbros_product/core/enumeration/request_state.dart';
import 'package:burningbros_product/core/enumeration/text_input_variant.dart';
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
import 'package:burningbros_product/core/widget/text_input.dart';
import 'package:burningbros_product/feature/product/presentation/search_for_products/bloc/search_products.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'search_for_products_app_bar.dart';
part 'search_for_products_body.dart';

class SearchForProductsScreen extends StatelessWidget {
  const SearchForProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const SearchForProductsAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sf),
        child: const SearchForProductsBody(),
      ),
      backgroundColor: AppColor.accent,
      bodyBgColor: AppColor.extremeLightGray,
      bodyPadding: EdgeInsets.only(top: 18.sf),
      resizeToAvoidBottomInset: false,
    );
  }
}
