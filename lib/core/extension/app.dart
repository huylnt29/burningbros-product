import 'package:burningbros_product/core/service_locator/service_locator.dart';
import 'package:burningbros_product/feature/product/presentation/view_favorite_products/bloc/favorite_products.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension AppX on MaterialApp {
  Widget wrapWithMultiBlocProvider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FavoriteProductsBloc>(),
        ),
      ],
      child: this,
    );
  }
}
