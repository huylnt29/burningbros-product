import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:burningbros_product/core/enumeration/request_state.dart';
import 'package:burningbros_product/feature/product/data/model/product.dart';
import 'package:burningbros_product/feature/product/domain/use_case/product.use_case.dart';

part 'favorite_products.event.dart';
part 'favorite_products.state.dart';

part 'favorite_products.bloc.freezed.dart';

class FavoriteProductsBloc
    extends Bloc<FavoriteProductsEvent, FavoriteProductsState> {
  FavoriteProductsBloc(this.useCase)
      : super(const FavoriteProductsState(
          getRequestState: RequestState.initial,
          addRequestState: RequestState.initial,
          removeRequestState: RequestState.initial,
        )) {
    on<VisitTheScreen>((event, emit) async {
      emit(state.copyWith(getRequestState: RequestState.loading));
      final res = await useCase.getAllFavorite();
      emit(state.copyWith(
        getRequestState: RequestState.loaded,
        result: res,
      ));
    });
  }

  final ProductUseCase useCase;
}
