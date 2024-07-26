// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/product/data/local_data_source/product.local_data_source.dart'
    as _i3;
import '../../feature/product/data/remote_data_source/product.remote_data_source.dart'
    as _i4;
import '../../feature/product/domain/repository/product.repository.dart' as _i6;
import '../../feature/product/domain/repository/product.repository_impl.dart'
    as _i7;
import '../../feature/product/domain/use_case/product.use_case.dart' as _i8;
import '../../feature/product/presentation/search_for_products/bloc/search_products.bloc.dart'
    as _i9;
import '../../feature/product/presentation/view_favorite_products/bloc/favorite_products.bloc.dart'
    as _i11;
import '../../feature/product/presentation/view_products/bloc/view_products.bloc.dart'
    as _i10;
import '../network/remote/rest_api_client.dart' as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ProductLocalDataSource>(() => _i3.ProductLocalDataSource());
  gh.factory<_i4.ProductRemoteDataSource>(
      () => _i4.ProductRemoteDataSource(gh<_i5.RestApiClient>()));
  gh.factory<_i6.ProductRepository>(() => _i7.ProductRepositoryImpl(
        gh<_i4.ProductRemoteDataSource>(),
        gh<_i3.ProductLocalDataSource>(),
      ));
  gh.factory<_i8.ProductUseCase>(
      () => _i8.ProductUseCase(gh<_i6.ProductRepository>()));
  gh.factory<_i9.SearchProductsBloc>(
      () => _i9.SearchProductsBloc(gh<_i8.ProductUseCase>()));
  gh.factory<_i10.ViewProductsBloc>(
      () => _i10.ViewProductsBloc(gh<_i8.ProductUseCase>()));
  gh.factory<_i11.FavoriteProductsBloc>(
      () => _i11.FavoriteProductsBloc(gh<_i8.ProductUseCase>()));
  return getIt;
}
