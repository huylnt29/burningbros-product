// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:burningbros_product/core/network/remote/rest_api_client.dart';

import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false,
)
configureDependencies({required Dio dio}) {
  getIt.registerLazySingleton<RestApiClient>(() => RestApiClient(dio));

  $initGetIt(getIt);
}
