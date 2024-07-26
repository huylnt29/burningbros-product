import 'package:burningbros_product/core/extension/widget.dart';
import 'package:burningbros_product/core/routing/route_config.dart';
import 'package:burningbros_product/core/routing/route_path.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
    ).wrapWithResponsiveSizer();
  }
}
