import 'package:burningbros_product/feature/product/data/model/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(this.product, {super.key});
  final Product product;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
