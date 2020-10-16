import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget{


  @override
  _ExploreScreenState createState() {
    return _ExploreScreenState();
  }


}

class _ExploreScreenState  extends State<ExploreScreen>{

  final topBar = new AppBar(
    backgroundColor: Colors.red,
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera_alt),
    title: SizedBox(height: 35.0, child: Image.asset("assets/images/my_yuopia_logo.jpeg")),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.send),
      )
    ],
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body:  new Text("explore Groups"),
    );

}}
