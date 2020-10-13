import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGroupsScreen extends StatefulWidget{

  @override
  _MyGroupState createState() {
    return _MyGroupState();
  }
}

class _MyGroupState  extends State<MyGroupsScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  new Text("Hello Groups"),
    );

}}
