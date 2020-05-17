import 'package:flutter/material.dart';
import 'package:lojavirtual/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pagerController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pagerController ,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeTab(),
        Container(color: Colors.yellow,),
        Container(color: Colors.red,),
        Container(color: Colors.blue,),
        Container(color: Colors.black,)
      ],
    );
  }
}

