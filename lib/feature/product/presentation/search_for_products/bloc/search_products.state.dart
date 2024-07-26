part of 'search_products.bloc.dart';

@freezed
class SearchProductsState with _$SearchProductsState {
  const factory SearchProductsState({
    required RequestState requestState,
    List<Product>? result,
    PaginationMeta? paginationMeta,
  }) = _SearchProductsState;
}
