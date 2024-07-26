import 'package:burningbros_product/core/routing/route_handler.dart';
import 'package:burningbros_product/core/routing/route_path.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

class Routes {
  Routes();

  static final router = FluroRouter();
  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  static void configureRoutes() {
    setRouter(
      RoutePath.splash,
      handler: splashHandler,
    );
    setRouter(
      RoutePath.products,
      handler: viewProductsHandler,
    );
    setRouter(
      RoutePath.favaroiteProducts,
      handler: viewFavoriteProductsHandler,
    );
    setRouter(
      RoutePath.searchForProducts,
      handler: searchForProductsHandler,
    );
    setRouter(
      RoutePath.internetLoss,
      handler: loseInternetScreenHandler,
    );
  }

  static void setRouter(
    String path, {
    required Handler handler,
    TransitionType? transitionType,
  }) {
    transitionType ??= TransitionType.cupertino;
    router.define(
      path,
      handler: handler,
      transitionType: transitionType,
    );
  }
}
