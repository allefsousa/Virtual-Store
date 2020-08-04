import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/data/cart_product.dart';
import 'package:lojavirtual/data/product_data.dart';

class CartTile extends StatelessWidget {

  final CartProduct cartProduct;

  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: cartProduct.productData == null ?
      FutureBuilder<DocumentSnapshot>(builder: (context,snapshot){
        if(snapshot.hasData){
          cartProduct.productData = ProductData.fromDocument(snapshot.data);
          return _buildContent();
        }else{
          return Container(
            height: 70.0,
            child: CircularProgressIndicator(),
            alignment: Alignment.center,
          );
        }
      },
        future: Firestore.instance.collection("products").document(
            cartProduct.category).collection("items")
            .document(cartProduct.pid)
            .get(),
      ) : _buildContent(),
    );
  }
  Widget _buildContent(){

  }
}
