import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yutopia/event.dart';
import 'package:my_yutopia/explore.dart';
import 'package:my_yutopia/my_group.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

PageController pageController;
class _HomePageState extends State<HomePage> {
  int _page = 0;

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }


  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera_alt),
    title: SizedBox(height: 35.0, child: Image.asset("assets/images/my_yuopia_logo.jpeg")),
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
      body: new PageView(
        children: [
          new Container(
            color: Colors.white,
            child: MyGroupsScreen(),
          ),
          new Container(
              color: Colors.white,
              child: ExploreScreen()
          ),
          new Container(
            color: Colors.white,
            child: EventScreen(),
          )
        ],
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new CupertinoTabBar(
        activeColor: Colors.orange,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: (_page == 0) ? Colors.black : Colors.grey),
              title: new Container(height: 0.0),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.search, color: (_page == 1) ? Colors.black : Colors.grey),
              title: new Container(height: 0.0),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.event, color: (_page == 2) ? Colors.black : Colors.grey),
              title: new Container(height: 0.0),
              backgroundColor: Colors.white)
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}