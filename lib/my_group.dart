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
  Widget appBarTitle = new Text(
    "Search Sample",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  bool _IsSearching = false;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    this._loadMyGroups();
  }

  _MyGroupState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  buildFeed() {
    if (myGroups != null) {
      return ListView(
        children: _IsSearching ? _buildSearchList() : myGroups,
        shrinkWrap: true,
      );
    } else {
      return Container(
          alignment: FractionalOffset.center,
          child: CircularProgressIndicator());
    }
  }

  List<Group> _buildSearchList() {
    if (_searchText.isEmpty) {
      return myGroups;
    } else {
      List<Group> _searchList = List();
      for (int i = 0; i < myGroups.length; i++) {
        Group group = myGroups.elementAt(i);
        if (group.name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(group);
        }
      }
      return _searchList;
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
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

              Container(
                  margin: EdgeInsets.all(5),
                  decoration: new BoxDecoration(
                    color: Colors.green,
                  ),
                  child: new IconButton(
                      icon: actionIcon,
                      onPressed: () {
                        setState(() {
                          if (this.actionIcon.icon == Icons.search) {
                            this.actionIcon = new Icon(
                              Icons.close,
                              color: Colors.white,
                            );
                            this.appBarTitle = new TextField(
                              controller: _searchQuery,
                              style: new TextStyle(
                                color: Colors.white,
                              ),
                              decoration: new InputDecoration(
                                  prefixIcon: new Icon(Icons.search,
                                      color: Colors.white),
                                  hintText: "Search...",
                                  hintStyle:
                                      new TextStyle(color: Colors.white)),
                            );
                            _handleSearchStart();
                          } else {
                            _handleSearchEnd();
                          }
                        });
                      })),


              Expanded(child: buildFeed()),
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
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg  ",
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
