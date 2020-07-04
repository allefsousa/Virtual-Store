import 'package:flutter/material.dart';
import 'package:lojavirtual/data/product_data.dart';

class ProductScreen extends StatefulWidget {

  final ProductData produc;
  ProductScreen(this.produc);

  @override
  _ProductScreenState createState() => _ProductScreenState(produc);
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductData product;
  _ProductScreenState(this.product)

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
