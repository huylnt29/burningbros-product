import 'package:burningbros_product/feature/product/data/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_product.g.dart';

@JsonSerializable()
class PaginatedProduct {
  PaginatedProduct({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory PaginatedProduct.fromJson(Map<String, Object?> json) =>
      _$PaginatedProductFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedProductToJson(this);

  List<Product>? products;
  int? total;
  int? skip;
  int? limit;
}
