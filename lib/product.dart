import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_yutopia/review.dart';
import 'package:my_yutopia/seller_group.dart';

class Product extends StatefulWidget {
  final String name;
  final String description;
  final ranking;
  final List<String> images;
  final String groupId;
  final amount;
  final List<Review> reviews;

  @override
  _Product createState() => _Product(
      this.name, this.description, this.ranking, this.images, this.groupId,this.amount);

  Product(this.name, this.description, this.ranking, this.images, this.groupId,this.amount,this.reviews);
}

class _Product extends State<Product> {
  final String name;
  final String description;
  final ranking;
  final List<String> images;
  final String groupId;
  final amount;

  _Product(
      this.name, this.description, this.ranking, this.images, this.groupId,this.amount);

  TextStyle boldStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        margin: EdgeInsets.all(4.0),
        child: Card(
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      images[index],
                      fit: BoxFit.fill,
                    );
                  },
                  pagination: new SwiperPagination(),
                  itemCount: images.length,
                  viewportFraction: 1,
                  scale: 0.8,
                ),
              ),

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
              Row(
                children: <Widget>[
                  Text("Rs " + amount.toString())
                ],
              )
            ],
          ),
        ));
  }
}
