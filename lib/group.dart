import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_yutopia/places_group.dart';
import 'package:my_yutopia/seller_group.dart';
import 'common_util.dart';

class Group extends StatelessWidget {
  Group(
      this.name,
      this.description,
      this.type,
      this.ranking,
      this.coverImageUrl,
      this.groupId,
      this.ownerId,
      this.suggestionCard,
      this.meta);

  final String name;
  final String description;
  final String type;
  final ranking;
  final String coverImageUrl;
  final String groupId;
  final String ownerId;
  final bool suggestionCard;
  final Map<String, dynamic> meta;

  TextStyle boldStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    if (!suggestionCard) {
      return buildMyGroupLayout();
    } else {
      return buildSuggestionCardLayout();
    }
  }

  Widget buildMyGroupLayout() {
    return Container(
      width: 200,
      margin: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            )),
            Stack(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  image: coverImageUrl,
                  placeholder: "assets/images/default_group.png",
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: new BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Text(
                    type,
                    style: boldStyle,
                  ),
                ),
              ],
            ),

            //Divider(color: Colors.grey),

            Text(
              name,
              style: boldStyle,
            ),
            StarRatingBar(ranking)
          ],
        ),
      ),
    );
  }

  Widget buildSuggestionCardLayout() {
    return Container(
        width: 250,
        margin: EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                )),
                Stack(
                  children: <Widget>[
                    FadeInImage.assetNetwork(
                      image: coverImageUrl,
                      placeholder: "assets/images/default_group.png",
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      decoration: new BoxDecoration(
                        color: Colors.yellow,
                      ),
                      child: Text(
                        type,
                        style: boldStyle,
                      ),
                    ),
                  ],
                ),

                //Divider(color: Colors.grey),

                Text(
                  name,
                  style: boldStyle,
                ),

                StarRatingBar(ranking),

                Container(
                  child: Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 2.0, // gap between lines
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Chip(
                        backgroundColor: Colors.deepPurple,
                        //padding: EdgeInsets.all(0),
                        label: Text('Interest1',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Chip(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.all(0),
                        label: Text('Interest1',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Chip(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.all(0),
                        label: Text('Interest1',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Chip(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.all(0),
                        label: Text('Interest1',
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
