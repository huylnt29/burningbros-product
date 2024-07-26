part of 'search_products.bloc.dart';

sealed class SearchProductsEvent {}

class SubmitSearchData extends SearchProductsEvent {
  SubmitSearchData(this.keyword);
  final String keyword;
}
