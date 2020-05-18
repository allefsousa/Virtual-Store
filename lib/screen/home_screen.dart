import 'package:flutter/material.dart';
import 'package:lojavirtual/tabs/home_tab.dart';
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
          body:HomeTab(), drawer: CustomDrawer()
        ),
      ],
    );
  }
}

