import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:burningbros_product/feature/product/presentation/search_for_products/presentation/search_for_products.screen.dart';
import 'package:burningbros_product/feature/product/presentation/view_favorite_products/presentation/view_favorite_products.screen.dart';
import 'package:burningbros_product/feature/product/presentation/view_products/presentation/view_products.screen.dart';
import 'package:burningbros_product/feature/splash/presentation/splash.screen.dart';

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
    return const ViewProductsScreen();
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
    return const SearchForProductsScreen();
  },
);
