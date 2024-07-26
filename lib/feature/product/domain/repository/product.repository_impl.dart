import 'package:injectable/injectable.dart';
import 'package:burningbros_product/feature/product/data/model/paginated_product.dart';
import 'package:burningbros_product/feature/product/domain/repository/product.repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl(
    super.remoteDataSource,
    super.localDataSource,
  );

  @override
  Future<PaginatedProduct?> getManyRemote({int? skip}) async {
    final res = await remoteDataSource.getMany(skip: skip);
    return res;
  }
}
