import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yutopia/cataloguge_screen.dart';
import 'package:my_yutopia/common_util.dart';
import 'package:my_yutopia/group.dart';
import 'package:my_yutopia/place.dart';
import 'package:my_yutopia/product.dart';
import 'package:my_yutopia/places_list.dart';
import 'package:my_yutopia/review.dart';

class PlacesGroup extends StatefulWidget {
  final Group group;

  PlacesGroup(this.group);

  @override
  _PlacesGroup createState() => _PlacesGroup(this.group);
}

class _PlacesGroup extends State<PlacesGroup> {
  final Group group;

  List<Place> places;

  @override
  void initState() {
    super.initState();
    deserialiseMeta();
  }

  _PlacesGroup(this.group);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GroupAppBar(group),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FittedBox(
                    // height: 150,
                    child: Image.network(
                      group.coverImageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllPlacesPage(group, places)));
                              },
                              child: Row(
                                children: <Widget>[
                                  Text("View All"),
                                  Icon(Icons.arrow_right)
                                ],
                              ),
                            )
                          ],
                        )),
                        Flexible(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: places == null || places.isEmpty
                                ? 0
                                : min(5, places.length),
                            itemBuilder: (context, index) {
                              return Container(
                                child: Center(child: places[index]),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Flexible(
                      child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(30),
                        height: 300,
                        color: Colors.blue,
                        child: Center(child: Text("POST DUDE")),
                      );
                    },
                  )),
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: Text('ADD POST'),
                icon: Icon(Icons.add),
                backgroundColor: Colors.pink,
              ),
            ),
//            Positioned(
//              left: 20,
//              bottom: 40,
//              child: FloatingActionButton.extended(
//                onPressed: () {},
//                label: Text('ADD REVIEW'),
//                icon: Icon(Icons.add),
//                backgroundColor: Colors.pink,
//              ),
//            ),
          ],
        ));
  }

  List<Place> getDummyPraces() {
    List<Review> reviews = [
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
      new Review("Nikhil", null,
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah "),
    ];
    List<Place> products = [
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),
      new Place(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          reviews,
          "1"),

    ];
    return products;
  }

  void deserialiseMeta() {
    places = getDummyPraces();
  }
}
