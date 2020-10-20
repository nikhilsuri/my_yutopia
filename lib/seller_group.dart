import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yutopia/group.dart';
import 'package:my_yutopia/product.dart';

class SellerGroup extends StatefulWidget {
  final Group group;

  SellerGroup(this.group);

  @override
  _SellerGroup createState() => _SellerGroup(
      this.group);



}

class _SellerGroup extends State<SellerGroup> {

  final Group group;

  List<Product> products;


  @override
  void initState() {
    super.initState();
    deserialiseMeta();
  }

  _SellerGroup(this.group);

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
        body: new Column(
          children: <Widget>[
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
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: const EdgeInsets.all(10.0),
                                child: const Text('About Seller',
                                    style: TextStyle(fontSize: 12)),
                              )),
                          Row(
                            children: <Widget>[
                              Text("View All"),
                              IconButton(icon: Icon(Icons.arrow_right))
                            ],
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
                          : products.length,
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
                child: Stack(
                  children: <Widget>[
                    ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:10,
                      itemBuilder: (context, index) {
                        return
                          Container(
                            margin: EdgeInsets.all(30),
                            height: 300,
                            color:  Colors.blue,
                            child: Center(child: Text(
                              "POST DUDE"
                            )),
                          );
                      },
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: FloatingActionButton.extended(
                        onPressed: () {},
                        label: Text('ADD'),
                        icon: Icon(Icons.add),
                        backgroundColor: Colors.pink,
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  List<Product> getDummyProducts() {
    List<Product> products = [
      new Product(
          "Product1",
          "Description1",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1"),
      new Product(
          "Product1",
          "Description1",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1"),
      new Product(
          "Product1",
          "Description1",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1"),
      new Product(
          "Product1",
          "Description1",
          2.0,
          [
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
            "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg"
          ],
          "1")
    ];
    return products;
  }

  void deserialiseMeta() {
    products = getDummyProducts();
  }
}
