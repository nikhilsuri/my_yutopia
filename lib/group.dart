import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_yutopia/activities_group.dart';
import 'package:my_yutopia/seller_group.dart';

class Group extends StatefulWidget {
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

  @override
  _Group createState() => _Group(
      this.name,
      this.description,
      this.type,
      this.ranking,
      this.coverImageUrl,
      this.groupId,
      this.ownerId,
      this.suggestionCard,
      this.meta);
}

class _Group extends State<Group> {
  final String name;
  final String description;
  final String type;
  final ranking;
  final String coverImageUrl;
  final String groupId;
  final String ownerId;
  final bool suggestionCard;
  final Map<String, dynamic> meta;

  _Group(
      this.name,
      this.description,
      this.type,
      this.ranking,
      this.coverImageUrl,
      this.groupId,
      this.ownerId,
      this.suggestionCard,
      this.meta);

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
          child: InkWell(
            onTap: () {
              GroupRouter(context, this);
            },
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
        ));
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

                Container(
                  child: Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    direction: Axis.horizontal,
                    children: <Widget>[
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

  void GroupRouter(BuildContext context, _Group group) {
    Group group = findGroupById(groupId);
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

  Group findGroupById(String groupId) {
    if( groupId == 1 )
    return new Group(
        "Group1",
        "description1",
        "SELLER",
        3.4,
        "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
        "1",
        "1",
        false,
        null);
  }
}
