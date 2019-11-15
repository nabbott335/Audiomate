import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0,110.0,0.0,0.0),
                  child: Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0,185.0,0.0,0.0),
                  child: Text(
                    'There',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(230.0,185.0,0.0,0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0,left: 20.0,right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email or UserName',
                    labelStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlueAccent)
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5.0),
                Container(
                  alignment: Alignment(1.0,0.0),
                  padding: EdgeInsets.only(top: 15.0,left: 20.0),
                  child: InkWell(
                    child: Text('Forgot Password',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ),

                ),
                SizedBox(height: 40.0),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.2,
                    child: GestureDetector(
                      onTap: (){
                        print("it's work");
                      },
                      child: Center(
                        child: Text('SignIn',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0,

                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: ImageIcon(AssetImage('assets/images/facebook.png')),

                        ),
                        SizedBox(width: 10.0,),
                        Center(
                          child: Text('LogIn with Facebook ',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )





              ],
            ),
          ),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('New in Spotify?',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,

                ),
              ),
              SizedBox(width: 5.0,),
              InkWell(
                onTap: (){
                  print('it work');
                  moveToSignUp();
                },
                child: Text('Register',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          )


        ],
      ),
    );

  }
  void moveToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignUp() ;
    }));

  }
}