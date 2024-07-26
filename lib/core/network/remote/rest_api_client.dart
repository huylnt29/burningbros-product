import 'package:burningbros_product/feature/product/data/model/paginated_product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi()
abstract class RestApiClient {
  factory RestApiClient(
    Dio dio, {
    String baseUrl,
  }) = _RestApiClient;

  @GET('/products?sortBy=id&order=asc&limit=20')
  Future<PaginatedProduct> getProducts({
    @Query('skip') String? skip,
  });

  @GET('/products/search?sortBy=id&order=asc&limit=0')
  Future<PaginatedProduct> getProductsSearch({
    @Query('q') String? query,
  });
}
