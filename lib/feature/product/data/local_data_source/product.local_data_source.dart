import 'package:burningbros_product/core/network/local/isar/isar_client.dart';
import 'package:burningbros_product/feature/product/data/model/product.dart';
import 'package:isar/isar.dart';

class CollectionLocalDataSource with IsarClient {
  late IsarCollection<Product> productCollection;
  CollectionLocalDataSource() {
    productCollection = isarInstance!.collection<Product>();
  }

  Future<List<Product>> getAll() async {
    final result = await productCollection.where().findAll();
    return result;
  }

  Future<int> put(Product product) async {
    int key = -1;
    await isarInstance!.writeTxn(() async {
      key = await productCollection.put(product);
    });
    return key;
  }

  Future<bool> delete(Product product) async {
    bool result = false;
    await isarInstance!.writeTxn(() async {
      result = await productCollection.delete(product.isarKey);
    });
    return result;
  }
}
