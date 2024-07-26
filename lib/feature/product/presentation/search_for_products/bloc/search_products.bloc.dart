import 'package:burningbros_product/feature/product/data/model/paginated_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:burningbros_product/core/enumeration/request_state.dart';
import 'package:burningbros_product/core/data/model/pagination_meta.dart';
import 'package:burningbros_product/feature/product/data/model/product.dart';
import 'package:burningbros_product/feature/product/domain/use_case/product.use_case.dart';

part 'search_products.event.dart';
part 'search_products.state.dart';

part 'search_products.bloc.freezed.dart';

class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  SearchProductsBloc(this.useCase)
      : super(const SearchProductsState(
          requestState: RequestState.initial,
        )) {
    on<SubmitSearchData>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));
      final res = await useCase.searchMany(event.keyword);
      if (res == null) {
        emit(state.copyWith(requestState: RequestState.error));
      } else {
        emit(state.copyWith(
          requestState: RequestState.loaded,
          result: res.products!,
          paginationMeta: res.getMeta(),
        ));
      }
    });
  }

  final ProductUseCase useCase;
}
