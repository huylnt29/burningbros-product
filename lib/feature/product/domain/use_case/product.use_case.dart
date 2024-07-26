import 'package:burningbros_product/core/data/constant/pagination.dart';
import 'package:burningbros_product/core/data/model/pagination_meta.dart';
import 'package:burningbros_product/feature/product/data/model/paginated_product.dart';
import 'package:burningbros_product/feature/product/data/model/product.dart';
import 'package:burningbros_product/feature/product/domain/repository/product.repository.dart';

class ProductUseCase {
  ProductUseCase(this.repository);
  final ProductRepository repository;

  Future<PaginatedProduct?> getManyWithPaging(
    PaginationMeta? paginationMeta,
  ) async {
    final res = await repository.getManyRemote(
      skip: (paginationMeta == null)
          ? 0
          : paginationMeta.skip + PaginationConstant.limit,
    );
    return res;
  }

  Future<PaginatedProduct?> searchMany(String keyword) async {
    final res = await repository.getManyBySearchingRemote(keyword);
    return res;
  }

  Future<List<Product>> getAllFavorite() async {
    final res = await repository.getAllLocal();
    return res;
  }

  Future<int> favoriteOne(Product product) async {
    final res = await repository.addOneLocal(product);
    return res;
  }

  Future<bool> unfavoriteOne(Product product) async {
    final res = await repository.deleteOneLocal(product);
    return res;
  }
}
