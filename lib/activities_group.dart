import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yutopia/cataloguge_screen.dart';
import 'package:my_yutopia/group.dart';
import 'package:my_yutopia/product.dart';
import 'package:my_yutopia/review.dart';

class ActivitiesGroup extends StatefulWidget {
  final Group group;

  ActivitiesGroup(this.group);

  @override
  _ActivitiesGroup createState() => _ActivitiesGroup(this.group);
}

class _ActivitiesGroup extends State<ActivitiesGroup> {
  final Group group;

  List<Product> products;

  @override
  void initState() {
    super.initState();
    deserialiseMeta();
  }

  _ActivitiesGroup(this.group);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
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
        ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Tooltip(
                                message: group.description,
                                child: FlatButton(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text(
                                    'About Seller',
                                  ),
                                )),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Cataloguge(group, products)));
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
                            itemCount: products == null || products.isEmpty
                                ? 0
                                : min(5, products.length),
                            itemBuilder: (context, index) {
                              return Container(
                                child: Center(child: products[index]),
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

  List<Product> getDummyProducts() {
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
    List<Product> products = [
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
      new Product(
          "Product1",
          "Hi , blah blah blah. blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah . blah blah blah blah blah ",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1",
          999,
          reviews),
    ];
    return products;
  }

  void deserialiseMeta() {
    products = getDummyProducts();
  }
}
