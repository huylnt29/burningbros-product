import 'dart:async';
import 'package:burningbros_product/app.dart';
import 'package:burningbros_product/core/network/local/isar/isar_client.dart';
import 'package:burningbros_product/core/network/local/shared_preferences/shared_preferences_client.dart';
import 'package:burningbros_product/core/network/remote/rest_api_config.dart';
import 'package:burningbros_product/core/routing/route_config.dart';
import 'package:burningbros_product/core/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await dotenv.load();

      configureDependencies(
        dio: RestApiConfig.initApiService(
          baseUrl: dotenv.env['SERVER'],
        ),
      );

      await SharedPreferencesClient.init();
      // await IsarClient.init();

      Routes.configureRoutes();

      runApp(const App());
    },
    (error, stackTrace) async {
      throw error;
    },
  );
}
