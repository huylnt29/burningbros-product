part of 'favorite_products.bloc.dart';

@freezed
class FavoriteProductsState with _$FavoriteProductsState {
  const factory FavoriteProductsState({
    required RequestState getRequestState,
    List<Product>? result,
    required RequestState addRequestState,
    required RequestState removeRequestState,
  }) = _FavoriteProductsState;
}
