import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
part 'product.g.dart';

@JsonSerializable()
@collection
class Product {
  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimension,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @JsonKey(includeFromJson: false)
  Id isarKey = Isar.autoIncrement;
  @Index(unique: true, replace: true)
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  @JsonKey(name: "dimensions")
  ProductDimension? dimension;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ProductReview>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  ProductMeta? meta;
  List<String>? images;
  String? thumbnail;
}

@JsonSerializable()
@embedded
class ProductMeta {
  ProductMeta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory ProductMeta.fromJson(Map<String, Object?> json) =>
      _$ProductMetaFromJson(json);
  Map<String, dynamic> toJson() => _$ProductMetaToJson(this);

  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;
}

@JsonSerializable()
@embedded
class ProductDimension {
  ProductDimension({this.width, this.height, this.depth});

  factory ProductDimension.fromJson(Map<String, Object?> json) =>
      _$ProductDimensionFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDimensionToJson(this);

  double? width;
  double? height;
  double? depth;
}

@JsonSerializable()
@embedded
class ProductReview {
  ProductReview({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ProductReview.fromJson(Map<String, Object?> json) =>
      _$ProductReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ProductReviewToJson(this);

  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;
}
