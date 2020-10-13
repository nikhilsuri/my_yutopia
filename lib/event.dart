import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget{

  @override
  _EventScreenState createState() {

    return _EventScreenState();
  }
}

class _EventScreenState  extends State<EventScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  new Text("Event"),
    );

}}
