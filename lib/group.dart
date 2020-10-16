import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Group extends StatefulWidget {


  Group(this.name, this.description, this.type, this.ranking,
      this.coverImageUrl, this.groupId, this.ownerId);


  final String name;
  final String description;
  final String type;
  final ranking;
  final String coverImageUrl;
  final String groupId;
  final String ownerId;


  @override
  _Group createState() =>
      _Group(
          this.name,
          this.description,
          this.type,
          this.ranking,
          this.coverImageUrl,
          this.groupId,
          this.ownerId
      );

}



class _Group extends State<Group> {

  final String name;
  final String description;
  final String type;
  final ranking;
  final String coverImageUrl;
  final String groupId;
  final String ownerId;


  _Group(this.name, this.description, this.type, this.ranking,
      this.coverImageUrl, this.groupId, this.ownerId);



  TextStyle boldStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Card(
        margin: EdgeInsets.all(15),
        elevation: 2,
        child: Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[


              Image.network(coverImageUrl),


              Divider(color: Colors.grey),


              Text(
                name,
                style: boldStyle,

              ),
              RatingBarIndicator(
                rating: ranking,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}