import 'package:flutter/material.dart';
import 'package:lojavirtual/tabs/home_tab.dart';
import 'package:lojavirtual/tabs/products_tab.dart';
import 'package:lojavirtual/widget/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pagerController = PageController();


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pagerController ,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body:HomeTab(), drawer: CustomDrawer(_pagerController)
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pagerController),
          body: ProductsTab(),
        ),
        Container(color: Colors.black,),
        Container(color: Colors.blue,),
        Container(color: Colors.orange,),
        Container(color: Colors.pink,)
      ],
    );
  }
}

