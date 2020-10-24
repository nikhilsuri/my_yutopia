import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_yutopia/product.dart';

class ProductView extends StatefulWidget {
  final Product product;

  ProductView(this.product);

  @override
  _ProductView createState() => _ProductView(product, 0);
}

class _ProductView extends State<ProductView> {
  final Product product;
  int pressed;

  _ProductView(this.product, this.pressed);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  product.images[index],
                  fit: BoxFit.fill,
                );
              },
              pagination: new SwiperPagination(),
              itemCount: product.images.length,
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
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(product.description),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text("Rs " + product.amount.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ));
    } else {
      return Container(
          height: 300,
          child: Column(children: <Widget>[
            RatingBarIndicator(
              rating: 2.0,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
            SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      product.reviews == null ? 0 : product.reviews.length,
                  itemBuilder: (context, index) {
                    return product.reviews[index];
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
