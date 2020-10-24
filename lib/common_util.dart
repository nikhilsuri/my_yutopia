import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_yutopia/activities_group.dart';
import 'package:my_yutopia/group.dart';
import 'package:my_yutopia/seller_group.dart';

void GroupRouter(BuildContext context, Group group) {
  String type = group.type;
  print(type);
  switch (type) {
    case "SELLER":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SellerGroup(group)),
      );
      break;
    case "ACTIVITIES":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivitiesGroup(group)),
      );
      break;
  }
}

Widget StarRatingBar(double score) {
  return RatingBarIndicator(
    rating: score,
    itemBuilder: (context, index) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 20.0,
    direction: Axis.horizontal,
  );
}

AppBar GroupAppBar(Group group) {
  return new AppBar(
    backgroundColor: Colors.red,
    centerTitle: true,
    elevation: 1.0,
    title: Text(
      group.name,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: new Tooltip(
            message: group.description,
            child: IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  /* your code */
                })),
      )
    ],
  );
}
