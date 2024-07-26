import 'package:burningbros_product/feature/product/data/model/paginated_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:burningbros_product/core/enumeration/request_state.dart';
import 'package:burningbros_product/core/data/model/pagination_meta.dart';
import 'package:burningbros_product/feature/product/data/model/product.dart';
import 'package:burningbros_product/feature/product/domain/use_case/product.use_case.dart';

part 'view_products.event.dart';
part 'view_products.state.dart';

part 'view_products.bloc.freezed.dart';

class ViewProductsBloc extends Bloc<ViewProductsEvent, ViewProductsState> {
  ViewProductsBloc(this.useCase)
      : super(const ViewProductsState(
          requestState: RequestState.initial,
        )) {
    on<VisitTheScreen>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));
      final res = await useCase.getManyWithPaging(state.paginationMeta);
      emit(state.copyWith(
        requestState: RequestState.loaded,
        result: res.products!,
        paginationMeta: res.getMeta(),
      ));
    });
    on<LoadMore>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));
      final res = await useCase.getManyWithPaging(
        state.paginationMeta,
      );
      emit(state.copyWith(
        requestState: RequestState.loaded,
        result: (state.result ?? []) + res.products!,
        paginationMeta: res.getMeta(),
      ));
    });
  }

  final ProductUseCase useCase;
}
