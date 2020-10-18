import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_yutopia/group.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() {
    return _ExploreScreenState();
  }
}

class _ExploreScreenState extends State<ExploreScreen> {
  HashMap<String, List<Group>> groupSuggestions =
      new HashMap<String, List<Group>>();

  @override
  void initState() {
    super.initState();
    loadSuggestions();
  }

  final topBar = new AppBar(
    backgroundColor: Colors.red,
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera_alt),
    title: SizedBox(
        height: 35.0, child: Image.asset("assets/images/my_yuopia_logo.jpeg")),
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
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            suggestionView("ForYou"),
            suggestionView("popular"),
            suggestionView("Universal")
          ],
        )));
  }

  Widget suggestionView(String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          type,
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.red),
        ),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:
                groupSuggestions == null || !groupSuggestions.containsKey(type)
                    ? 0
                    : groupSuggestions[type].length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(child: groupSuggestions[type][index]),
              );
            },
          ),
        )
      ],
    );
  }

  void loadSuggestions() {
    List<Group> groups = [
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1"),
      new Group(
          "Group2",
          "description2",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1"),
      new Group(
          "Group3",
          "description3",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1"),
      new Group(
          "Group4",
          "description4",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1"),
      new Group(
          "Group5",
          "description5",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1"),
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1")
    ];

    groupSuggestions["ForYou"] = groups;
    groupSuggestions["Universal"] = groups;
    groupSuggestions["popular"] = groups;
  }
}
