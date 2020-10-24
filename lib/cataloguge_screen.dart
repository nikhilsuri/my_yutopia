import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_yutopia/group.dart';
import 'package:my_yutopia/product.dart';
import 'package:my_yutopia/product_view.dart';

class Cataloguge extends StatefulWidget {
  final Group group;
  final List<Product> products;

  Cataloguge(this.group, this.products);

  @override
  _Catalogue createState() => _Catalogue(this.group, this.products);
}

class _Catalogue extends State<Cataloguge> {
  final Group group;
  final List<Product> products;

  _Catalogue(this.group, this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            elevation: 1.0,
            title: Text(
              "CATALOGUE",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: products == null || products.isEmpty ? 0 : products.length,
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
                                  child: ProductView(products[index]),
                                );
                              },
                            )));
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => ProductView(products[index])));
                  },
                  child: Row(
                    children: <Widget>[
                      Image.network(products[index].images[0],
                          fit: BoxFit.fill),
                      Column(
                        children: <Widget>[
                          Text(products[index].name),
                          //Text(products[index].description),
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
                              Text("Rs " + products[index].amount.toString())
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ));
          },
        ));
  }
}
