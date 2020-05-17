import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pagerController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pagerController ,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(color: Colors.yellow,),
        Container(color: Colors.red,),
        Container(color: Colors.blue,),
        Container(color: Colors.black,)
      ],
    );
  }
}

