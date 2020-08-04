import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual/data/cart_product.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class CartModel extends Model{

  UserModel user;

  CartModel(this.user);

  bool isLoading = false;

  List<CartProduct> products = [];

  static CartModel of(BuildContext context) => ScopedModel.of<CartModel>(context);


  void addCartItem(CartProduct cartProduct){
    products.add(cartProduct);


    // Adicionando produto ao carrinho
    Firestore.instance.collection("user").document(user.firebaseUser.uid)
    .collection("cart").add(cartProduct.toMap()).then((doc){
      cartProduct.cid = doc.documentID;
    });

    notifyListeners();

  }

  void removeCartItem(CartProduct cartProduct){

    Firestore.instance.collection("user").document(user.firebaseUser.uid)
        .collection("cart").document(cartProduct.cid).delete();

    products.remove(cartProduct);

    notifyListeners();

  }




}