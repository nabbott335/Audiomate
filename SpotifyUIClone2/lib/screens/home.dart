import 'package:flutter/material.dart';
import 'package:spotify_clone/tabs/home_tab.dart';
import 'package:spotify_clone/tabs/library_tab.dart';
import 'package:spotify_clone/tabs/premium_tab.dart';
import 'package:spotify_clone/tabs/search_tab.dart';

import 'package:flutter/material.dart';
import 'package:spotify_clone/modal_class/artist.dart';
import 'package:spotify_clone/widgets/horizontal_artist.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

/*void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://10.0.2.2:8000/Playlist/"),
        headers: {
          "Accept": "application/json"
        }
    );
    data = json.decode(response.body);
    print(data[1]["title"]);

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Get data"),
          onPressed: getData,
        ),
      ),
    );
  }
}

*/
void main() {
  HttpClient()
      .getUrl(Uri.parse('http://10.0.2.2:8000/Playlist/')) // produces a request object
      .then((request) => request.close()) // sends the request
      .then((response) =>
      response.transform(Utf8Decoder()).listen(print)); // transforms and prints the response
}

@override
Widget build(BuildContext context) {
  return new Scaffold(
    body: new Center(
      child: new RaisedButton(
        child: new Text("Get data"),
        onPressed: main,
      ),
    ),
  );
}

Future<Post> fetchPost() async {
  final response =
  await http.get('https:student.cs.plattsburgh.edu');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');






  }

}



class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main2() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,

        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool isPlaying = true;
  var _value = 0.0;
  void handlePressed() {
    print('Hello');
    setState(() {
      isPlaying = true;
    });
  }

  Widget songPlaying() {
    return Scaffold(
      resizeToAvoidBottomPadding: false,



      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(''),
          ),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                title: Text('Listening ...'),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  onPressed: () {
                    setState(() {
                      isPlaying = false;
                    });
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  )
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
             /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _value,
                  onChanged: (value) {
                    //print(value);
                    setState(() {
                      _value = value;
                    });
                  },
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,

                  // valueColor: AlwaysStoppedAnimation(Color(0xff828A8A)),
                  // backgroundColor: Color(0xff666666),
                ),
              ),

              */
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.skip_previous, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 50,
                      icon: Icon(
                          isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                          color: Colors.white),
                      onPressed: () {
                        setState(() {
                          if (isPlaying) {
                            isPlaying = false;
                          } else {
                            isPlaying = true;
                          }
                        });
                      },
                    ),
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.skip_next, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.clear, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          resizeToAvoidBottomPadding: false,

          body: Container(
            color: Theme.of(context).accentColor,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: _currentIndex == 0
                          ? HomeTab(
                        onPressed: handlePressed,
                      )
                          : _currentIndex == 1
                          ? SearchTab()
                          : _currentIndex == 2
                          ? LibraryTab()
                          : PremiumTab(),
                    ),
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
                isPlaying
                    ? Container()
                    : Positioned(
                  bottom: 20,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  // Expanded(
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.rectangle,
                                  //       borderRadius:
                                  //           BorderRadius.circular(8),
                                  //       border: Border.all(
                                  //           color: Colors.white,
                                  //           width: 1),
                                  //       image: DecorationImage(
                                  //         fit: BoxFit.cover,
                                  //         image: AssetImage(
                                  //             'assets/bohemian.jpg'),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   flex: 1,
                                  // ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    flex: 3,
                                  ),
                                  IconButton(
                                    iconSize: 30,
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    iconSize: 30,
                                    icon: Icon(
                                      Icons.skip_next,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
                canvasColor: Theme.of(context).primaryColor,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                    caption: TextStyle(
                        color: Color(
                            0xffA7A8AC)))), // sets the inactive color of the `BottomNavigationBar`
            child: BottomNavigationBar(
              onTap: _onTabTapped,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Search'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_music),
                  title: Text('Library'),
                ),
                //BottomNavigationBarItem(
                //icon: Icon(Icons.monetization_on),
                //title: Text('Premium'),
                //),

              ],
            ),
          ),
        ),
        isPlaying ? songPlaying() : Container()
      ],
    );
  }

  void _onTabTapped(int value) {
    print(value);
    setState(() {
      _currentIndex = value;
    });
  }
}