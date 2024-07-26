import 'package:burningbros_product/feature/product/data/model/paginated_product.dart';
import 'package:burningbros_product/core/network/remote/rest_api_client.dart';

class ProductRemoteDataSource {
  ProductRemoteDataSource(this.restApiClient);
  final RestApiClient restApiClient;

  Future<PaginatedProduct> getMany({int? skip}) async {
    final response = await restApiClient.getProducts(
      skip: skip.toString(),
    );
    return response;
  }
}
