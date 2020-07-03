import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/tiles/category_tille.dart';

class ProductsTab extends StatefulWidget {
  @override
  _ProductsTabState createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else{
          var divideTiles = ListTile.divideTiles(
              tiles: snapshot.data.documents.map((doc) {
                return CategoryTile(doc);
              }).toList(),
              color: Colors.grey[500])
              .toList();

          return ListView(
            children: divideTiles,
          );
        }
      },
    );
  }
}
