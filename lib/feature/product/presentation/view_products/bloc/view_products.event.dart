part of 'view_products.bloc.dart';

sealed class ViewProductsEvent {}

class VisitTheScreen extends ViewProductsEvent {
  VisitTheScreen();
}

class LoadMore extends ViewProductsEvent {
  LoadMore();
}
