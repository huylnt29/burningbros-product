import 'package:burningbros_product/core/extension/app.dart';
import 'package:burningbros_product/core/extension/logger.dart';
import 'package:burningbros_product/core/extension/widget.dart';
import 'package:burningbros_product/core/routing/route_config.dart';
import 'package:burningbros_product/core/routing/route_path.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    InternetConnectionChecker().onStatusChange.listen((status) {
      Logger.v(status);
      if (status == InternetConnectionStatus.connected) {
        Routes.router.navigateTo(
          navigatorKey.currentContext!,
          RoutePath.splash,
          clearStack: true,
        );
      } else {
        Routes.router.navigateTo(
          navigatorKey.currentContext!,
          RoutePath.internetLoss,
          clearStack: true,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColor.lightGray,
    ));

    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.router.generator,
      initialRoute: RoutePath.splash,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: const [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
    ).wrapWithMultiBlocProvider().wrapWithResponsiveSizer();
  }
}
