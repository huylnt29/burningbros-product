import 'package:burningbros_product/feature/product/data/model/product.dart';
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

  @override
  Future<PaginatedProduct?> getManyBySearchingRemote(String keyword) async {
    final res = await remoteDataSource.getManyBySearching(keyword);
    return res;
  }

  @override
  Future<int> addOneLocal(Product product) async {
    final res = await localDataSource.put(product);
    return res;
  }

  @override
  Future<bool> deleteOneLocal(Product product) async {
    final res = await localDataSource.delete(product);
    return res;
  }
}
