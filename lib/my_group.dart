import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_yutopia/activities_group.dart';
import 'package:my_yutopia/group.dart';
import 'common_util.dart';

class MyGroupsScreen extends StatefulWidget {
  @override
  _MyGroupState createState() {
    return _MyGroupState();
  }
}

class _MyGroupState extends State<MyGroupsScreen> {
  List<Group> myGroups;

  List<Group> filteredMyGroups;
  Widget appBarTitle = new Text(
    "Search Sample",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
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

  buildFeed() {
    if (filteredMyGroups != null) {
      return StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: filteredMyGroups.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              GroupRouter(context, filteredMyGroups[index]);
            },
            child: filteredMyGroups[index],
          );
        },
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      );
    } else {
      return Container(
          alignment: FractionalOffset.center,
          child: CircularProgressIndicator());
    }
  }

  void _buildSearchList() {
    //filteredMyGroups.clear();
    if (_searchText.isEmpty) {
      filteredMyGroups = myGroups;
    } else {
      List<Group> _searchList = List();
      for (int i = 0; i < myGroups.length; i++) {
        Group group = myGroups.elementAt(i);
        if (group.name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(group);
        }
      }
      filteredMyGroups = _searchList;
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
      _searchText = _searchQuery.text;
      _buildSearchList();
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchText = "";
      _searchQuery.clear();
      _buildSearchList();
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
            Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Container(
                        width: 320,
                        child: new TextField(
                            autocorrect: true,
                            controller: _searchQuery,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  iconSize: 30,
                                  onPressed: () {
                                    setState(() {
                                      if (this.actionIcon.icon ==
                                          Icons.search) {
                                        this.actionIcon = new Icon(
                                          Icons.close,
                                        );
                                        this.appBarTitle = new TextField(
                                          // controller: _searchQuery,
                                          style: new TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: new InputDecoration(
                                              prefixIcon: new Icon(Icons.search,
                                                  color: Colors.white),
                                              hintText: "Search...",
                                              hintStyle: new TextStyle(
                                                  color: Colors.white)),
                                        );
                                        _handleSearchStart();
                                      } else {
                                        _handleSearchEnd();
                                      }
                                    });
                                  },
                                  icon: actionIcon),
                              hintText: _IsSearching
                                  ? _searchText
                                  : 'Search My Groups',
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ))))
              ],
            ),

            Expanded(
              child: buildFeed(),
              //children: <Widget>[

//                Positioned(
//                  left: 10,
//                  bottom: 20,
//                  child: FloatingActionButton.extended(
//                    onPressed: () {},
//                    label: Text('ADD'),
//                    icon: Icon(Icons.add),
//                    backgroundColor: Colors.pink,
//                  ),
//                ),
              //  ],
            ),

//              RaisedButton(
//                color: Colors.blue,
//              )
          ],
        ),
      ),
    );
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

    List<Group> groups = getUserGroups();
    setState(() {
      myGroups = groups;
      filteredMyGroups = groups;
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

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _searchQuery.dispose();
    super.dispose();
  }

  List<Group> getUserGroups() {
    List<Group> groups = [
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group2",
          "description2",
          "ACTIVITIES",
          4.0,
          "https://miro.medium.com/max/4800/1*jFyawcsqoYctkTuZg6wQ1A.jpeg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group2",
          "description2",
          "ACTIVITIES",
          4.0,
          "https://miro.medium.com/max/4800/1*jFyawcsqoYctkTuZg6wQ1A.jpeg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group2",
          "description2",
          "ACTIVITIES",
          4.0,
          "https://miro.medium.com/max/4800/1*jFyawcsqoYctkTuZg6wQ1A.jpeg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group2",
          "description2",
          "ACTIVITIES",
          4.0,
          "https://miro.medium.com/max/4800/1*jFyawcsqoYctkTuZg6wQ1A.jpeg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group2",
          "description2",
          "ACTIVITIES",
          4.0,
          "https://miro.medium.com/max/4800/1*jFyawcsqoYctkTuZg6wQ1A.jpeg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group2",
          "description2",
          "ACTIVITIES",
          4.0,
          "https://miro.medium.com/max/4800/1*jFyawcsqoYctkTuZg6wQ1A.jpeg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group1",
          "description1",
          "SELLER",
          3.4,
          "https://c4.wallpaperflare.com/wallpaper/122/807/700/planetary-ring-ringed-planet-planet-stars-wallpaper-preview.jpg",
          "1",
          "1",
          false,
          null),
      new Group(
          "Group2",
          "description2",
          "ACTIVITIES",
          4.0,
          "https://miro.medium.com/max/4800/1*jFyawcsqoYctkTuZg6wQ1A.jpeg",
          "1",
          "1",
          false,
          null),
    ];
    return groups;
  }
}
