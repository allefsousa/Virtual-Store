import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsTab extends StatefulWidget {
  @override
  _ProductsTabState createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context,snapshot){
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator(),);
        else
          return ListView(
            children: <Widget>[

            ],
          );
      },
    );
  }
}
