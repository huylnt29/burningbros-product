part of 'favorite_products.bloc.dart';

sealed class FavoriteProductsEvent {}

class VisitTheScreen extends FavoriteProductsEvent {
  VisitTheScreen();
}

class Favorite extends FavoriteProductsEvent {
  Favorite(this.product);
  final Product product;
}

class Unfavorite extends FavoriteProductsEvent {
  Unfavorite(this.product);
  final Product product;
}
