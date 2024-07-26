import 'package:burningbros_product/feature/product/data/model/paginated_product.dart';
import 'package:burningbros_product/feature/product/domain/repository/product.repository.dart';

class ProductUseCase {
  ProductUseCase(this.repository);
  final ProductRepository repository;

  Future<PaginatedProduct> getManyWithPaging(int currentItems) async {
    final res = await repository.getManyRemote(skip: currentItems);
    return res;
  }
}
