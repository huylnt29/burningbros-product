import 'package:burningbros_product/core/data/model/paginated_product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi()
abstract class RestApiClient {
  factory RestApiClient(
    Dio dio, {
    String baseUrl,
  }) = _RestApiClient;

  @GET('/products?limit=20&sortBy=id&order=asc')
  Future<PaginatedProduct> getProducts({
    @Query('skip') String? skip,
  });
}
