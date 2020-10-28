import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_yutopia/common_util.dart';
import 'package:my_yutopia/place.dart';
import 'package:my_yutopia/product.dart';

class PlaceView extends StatefulWidget {
  final Place place;

  PlaceView(this.place);

  @override
  _PlaceView createState() => _PlaceView(place, 0);
}

class _PlaceView extends State<PlaceView> {
  final Place place;
  int pressed;

  _PlaceView(this.place, this.pressed);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  place.images[index],
                  fit: BoxFit.fill,
                );
              },
              pagination: new SwiperPagination(),
              itemCount: place.images.length,
              viewportFraction: 1,
              scale: 0.8,
            ),
          ),
          Row(
            children: <Widget>[
              ButtonWidget(
                  stateSetter1, pressed == 0 ? true : false, "OverView"),
              ButtonWidget(stateSetter2, pressed == 1 ? true : false, "Rating"),
            ],
          ),
          getView()
        ],
      ),
    );
  }

  getView() {
    if (pressed == 0) {
      return Container(
          height: 300,
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                place.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(place.description),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text("Location",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ));
    } else {
      return Container(
          height: 300,
          child: Column(children: <Widget>[
            StarRatingBar(2.0),
            SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      place.reviews == null ? 0 : place.reviews.length,
                  itemBuilder: (context, index) {
                    return place.reviews[index];
                  }),
            )
          ]));
    }
  }

  void stateSetter1() {
    setState(() {
      this.pressed = 0;
    });
  }

  void stateSetter2() {
    setState(() {
      this.pressed = 1;
    });
  }
}

class ButtonWidget extends StatelessWidget {
  final VoidCallback setter;
  bool highlight;
  String text;

  ButtonWidget(this.setter, this.highlight, this.text);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: setter,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: highlight ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
