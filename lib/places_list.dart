import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_yutopia/common_util.dart';
import 'package:my_yutopia/group.dart';
import 'package:my_yutopia/place.dart';
import 'package:my_yutopia/place_view.dart';
import 'package:my_yutopia/product.dart';
import 'package:my_yutopia/product_view.dart';

class AllPlacesPage extends StatefulWidget {
  final Group group;
  final List<Place> places;

  AllPlacesPage(this.group, this.places);

  @override
  _AllPlacesPage createState() => _AllPlacesPage(this.group, this.places);
}

class _AllPlacesPage extends State<AllPlacesPage> {
  final Group group;
  final List<Place> places;

  _AllPlacesPage(this.group, this.places);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            elevation: 1.0,
            title: Text(
              "PLACES",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: places == null || places.isEmpty ? 0 : places.length,
          itemBuilder: (context, index) {
            return SizedBox(
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            content: Builder(
                              builder: (context) {
                                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                return Container(
                                    //  height: height - 300,
                                    width: 400,
                                    child:
                                        PlaceView(places[index]),
                                    );
                              },
                            )));
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => ProductView(products[index])));
                  },
                  child: Row(
                    children: <Widget>[
                      Image.network(places[index].images[0], fit: BoxFit.fill),
                      Column(
                        children: <Widget>[
                          Text(places[index].name),
                          StarRatingBar(2.0),
                          Text("LOCATION LINK"),
                        ],
                      )
                    ],
                  ),
                ));
          },
        ));
  }
}
