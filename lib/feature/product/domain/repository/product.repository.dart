import 'package:burningbros_product/feature/product/data/local_data_source/product.local_data_source.dart';
import 'package:burningbros_product/feature/product/data/model/paginated_product.dart';
import 'package:burningbros_product/feature/product/data/remote_data_source/product.remote_data_source.dart';

abstract class ProductRepository {
  ProductRepository(this.remoteDataSource, this.localDataSource);
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  Future<PaginatedProduct> getManyRemote({int? skip});
}
