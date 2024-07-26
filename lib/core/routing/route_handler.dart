import 'package:burningbros_product/core/service_locator/service_locator.dart';
import 'package:burningbros_product/feature/internet/presentation/lose_internet.screen.dart';
import 'package:burningbros_product/feature/product/presentation/search_for_products/bloc/search_products.bloc.dart';
import 'package:burningbros_product/feature/product/presentation/view_products/bloc/view_products.bloc.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:burningbros_product/feature/product/presentation/search_for_products/search_for_products.screen.dart';
import 'package:burningbros_product/feature/product/presentation/view_favorite_products/view_favorite_products.screen.dart';
import 'package:burningbros_product/feature/product/presentation/view_products/view_products.screen.dart';
import 'package:burningbros_product/feature/splash/presentation/splash.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Handler splashHandler = Handler(
  handlerFunc: (
    BuildContext? context,
    Map<String, List<String>> params,
  ) =>
      const SplashScreen(),
);

Handler viewProductsHandler = Handler(
  handlerFunc: (
    BuildContext? context,
    Map<String, List<String>> params,
  ) {
    return BlocProvider(
      create: (context) => getIt<ViewProductsBloc>()..add(VisitTheScreen()),
      child: const ViewProductsScreen(),
    );
  },
);

Handler viewFavoriteProductsHandler = Handler(
  handlerFunc: (
    BuildContext? context,
    Map<String, List<String>> params,
  ) {
    return const ViewFavoriteProductsScreen();
  },
);

Handler searchForProductsHandler = Handler(
  handlerFunc: (
    BuildContext? context,
    Map<String, List<String>> params,
  ) {
    return BlocProvider(
      create: (context) => getIt<SearchProductsBloc>(),
      child: const SearchForProductsScreen(),
    );
  },
);

Handler loseInternetScreenHandler = Handler(
  handlerFunc: (
    BuildContext? context,
    Map<String, List<String>> params,
  ) {
    return const LoseInternetScreen();
  },
);
