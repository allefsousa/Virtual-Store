import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lojavirtual/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Carinho"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(builder: (context,child,model){
              int productCount = model.products.length;
              return Text(
                "${productCount ?? 0} ${productCount ==1 ? "ITEM" : "ITEMS" }",
                style: TextStyle(fontSize: 17.0),
              );
            }),
          )
        ],
      ),
    );
  }
}
