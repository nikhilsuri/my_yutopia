import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yutopia/group.dart';

class SellerGroup extends StatelessWidget {
  final Group group;

  SellerGroup(this.group);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
      backgroundColor: Colors.red,
      centerTitle: true,
      elevation: 1.0,
      title: Text(
        group.description,
        style: TextStyle(
          fontWeight:  FontWeight.bold
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(Icons.info),
        )
      ],
    ),

body: Text("Seller Group"),

    );
  }
}
