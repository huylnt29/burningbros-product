part of 'view_products.bloc.dart';

@freezed
class ViewProductsState with _$ViewProductsState {
  const factory ViewProductsState({
    required RequestState requestState,
    List<Product>? result,
    PaginationMeta? paginationMeta,
  }) = _ViewProductsState;
}
