import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yutopia/group.dart';

class MyGroupsScreen extends StatefulWidget {
  @override
  _MyGroupState createState() {
    return _MyGroupState();
  }
}

class _MyGroupState extends State<MyGroupsScreen> {
  List<Group> myGroups;

  @override
  void initState() {
    super.initState();
    this._loadMyGroups();
  }

  buildFeed() {
    if (myGroups != null) {
      return ListView(
        children: myGroups,
        shrinkWrap: true,
      );
    } else {
      return Container(
          alignment: FractionalOffset.center,
          child: CircularProgressIndicator());
    }
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
        body: Container(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[Text("I am search space")],
              ),



              RefreshIndicator(
                onRefresh: _refresh,
                child:
                Expanded(
                  child:buildFeed()
                ),
              )
            ],
          ),
        ));
  }

  Future<Null> _refresh() async {
    await _getMyGroups();
    setState(() {});

    return;
  }

  _loadMyGroups() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String json = prefs.getString("feed");
//
//    if (json != null) {
//      List<Map<String, dynamic>> data =
//      jsonDecode(json).cast<Map<String, dynamic>>();
//      List<ImagePost> listOfPosts = _generateFeed(data);
//      setState(() {
//        feedData = listOfPosts;
//      });
//    } else {
    _getMyGroups();
//    }
  }

  _getMyGroups() async {
//
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    String userId = googleSignIn.currentUser.id.toString();
//    var url =
//        'https://us-central1-mp-rps.cloudfunctions.net/getFeed?uid=' + userId;
//    var httpClient = HttpClient();
//
//    List<ImagePost> listOfPosts;
//    String result;
//    try {
//      var request = await httpClient.getUrl(Uri.parse(url));
//      var response = await request.close();
//      if (response.statusCode == HttpStatus.ok) {
//        String json = await response.transform(utf8.decoder).join();
//        prefs.setString("feed", json);
//        List<Map<String, dynamic>> data =
//        jsonDecode(json).cast<Map<String, dynamic>>();
//        listOfPosts = _generateFeed(data);
//        result = "Success in http request for feed";
//      } else {
//        result =
//        'Error getting a feed: Http status ${response.statusCode} | userId $userId';
//      }
//    } catch (exception) {
//      result = 'Failed invoking the getFeed function. Exception: $exception';
//    }
//    print(result);

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
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg ",
          "1",
          "1"),
      new Group(
          "Group1",
          "description1",
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
          "1"),
      new Group(
          "Group1",
          "description1",
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
    setState(() {
      myGroups = groups;
    });
  }

//  List<Group> _generateFeed(List<Map<String, dynamic>> feedData) {
//    List<ImagePost> listOfPosts = [];
//
//    for (var postData in feedData) {
//      listOfPosts.add(ImagePost.fromJSON(postData));
//    }
//
//    return listOfPosts;
//  }

  // ensures state is kept when switching pages
  @override
  bool get wantKeepAlive => true;
}
