import 'package:burningbros_product/core/enumeration/request_state.dart';

extension RequestStateX on RequestState {
  bool get isLoading => this == RequestState.loading;
  bool get isInitial => this == RequestState.initial;
  bool get isError => this == RequestState.error;
  bool get isLoaded => this == RequestState.loaded;
  bool get shouldReset =>
      this != RequestState.loaded && this != RequestState.error;
}
