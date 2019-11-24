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


class HomeTab extends StatefulWidget {
  final VoidCallback onPressed;
  HomeTab({this.onPressed});
  @override
  HomeTabState createState() {
    return new HomeTabState();
  }
}
class HomeTabState extends State<HomeTab> {
  bool isShown = true;
  bool isPlaying = false;
  final List<Artist> recentlyPlayed = [
    Artist(
        imageSrc: "assets/favourite.jpg",
        title: 'Favourite Songs',
        circular: false),
    Artist(
        imageSrc: "assets/pink_floyd.jpg", title: 'Pink Floyd', circular: true),
    Artist(
        imageSrc: "assets/queen_best_of.jpg",
        title: 'Queen : Best of',
        circular: false),
    Artist(
        imageSrc: "assets/this_is_post_malone.jpg",
        title: 'This is Post Malone',
        circular: false),
  ];

  final List<Artist> heavyRotation = [
    Artist(
        imageSrc: "assets/hailee.jpg",
        title: 'Hailee Steinfeld',
        circular: true),
    Artist(
        imageSrc: "assets/stoney.jpg",
        title: 'Stoney(deluxe)',
        circular: false),
    Artist(
        imageSrc: "assets/this_is_queen.jpg",
        title: 'This is Queen',
        circular: false),
    Artist(
        imageSrc: "assets/queen_best_of.jpg",
        title: 'Queen : Best of',
        circular: false),
    Artist(
        imageSrc: "assets/this_is_post_malone.jpg",
        title: 'This is Post Malone',
        circular: false),
  ];

  final List<Artist> madeForYou = [
    Artist(
        imageSrc: "assets/discover.jpg",
        title: 'Discover Weekly',
        circular: false),
    Artist(
        imageSrc: "assets/time_capsule.jpg",
        title: 'Time Capsule',
        circular: false),
  ];
  void handleTap() {
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).accentColor,
              floating: false,
              pinned: false,
              title: Text(''),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                )
              ],
            ),
          ];
        },
        body: Container(
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Your Recently Searched',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(
                    child: ArtistList(
                      artists: recentlyPlayed,
                      onPressed: () {},
                    ),
                    height: 160.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Your Playlists',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(
                    child: ArtistList(
                      artists: heavyRotation,
                      onPressed: () {},
                    ),
                    height: 185.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Made for You',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(
                    child: ArtistList(
                      artists: madeForYou,
                      onPressed: () {},
                    ),
                    height: 185.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
