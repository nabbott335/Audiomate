import 'package:flutter/material.dart';
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



class LibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: tabBarControllerHome(context),
        ));
  }

  Widget tabBarControllerHome(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: Material(
              color: Theme.of(context).accentColor,
              child: TabBar(
                tabs: [
                  Tab(
                    text: "Playlists",
                  ),
                  Tab(
                    text: "Artists",
                  ),
                  Tab(
                    text: "Albums",
                  ),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorSize: (TabBarIndicatorSize.label),
                indicatorColor: Colors.green,
              ),
            ),
          ),
          body: TabBarView(children: [
            Container(
              child: FlatButton(
                  onPressed: main,
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                Icons.library_music,
                color: Colors.white,
                size: 75,
              )),
              color: Theme.of(context).accentColor,
            ),
            Container(
              child: FlatButton(
                  onPressed: main,
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                Icons.person,
                color: Colors.white,
                size: 75,
              )),
              color: Theme.of(context).accentColor,
            ),
            Container(
              child: FlatButton(
                  onPressed: main,
                  padding: EdgeInsets.all(0.0),
                  child: SizedBox(
                width: 100,
                height: 100,
                  child: Icon(
                Icons.album,

                color: Colors.white,
                size: 75,
              )),
              color: Theme.of(context).accentColor,
            ),
          )],
        )));

  }
}
