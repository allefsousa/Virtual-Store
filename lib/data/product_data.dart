import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String id;

  String title;
  String category;
  String description;
  double price;

  List images;
  List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["decription"];
    price = snapshot.data["price"];
    images = snapshot.data["images"];
    sizes = snapshot.data["size"];
  }


  Map<String,dynamic> toResumeMap() {
    return{
      "title":title,
      "description":description,
      "price":price
    };
  }

}
