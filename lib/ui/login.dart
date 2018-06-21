import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "Type in your credentials";

  void _login() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = "Welcome, ${_userController.text}!";
      } else {
        _welcomeString = "Type in your credentials";
      }
    });
  }

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Login"),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.blueGrey,
        body: new Container(
            alignment: Alignment.topCenter,
            child: new ListView(
              children: <Widget>[
                //Image
                new Image.asset('images/ic_person.png',
                    width: 50.0, height: 50.0, color: Colors.greenAccent),

                //Form
                new Container(
                    height: 180.0,
                    width: 380.0,
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new TextField(
                          controller: _userController,
                          decoration: new InputDecoration(
                              hintText: 'Username',
                              icon: new Icon(Icons.perm_contact_calendar)),
                        ),
                        new TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: new InputDecoration(
                              hintText: 'Password', icon: new Icon(Icons.lock)),
                        ),
                        new Padding(padding: new EdgeInsets.all(10.5)),
                        new Center(
                            child: new Row(
                          children: <Widget>[
                            //Login button
                            new Container(
                              margin: new EdgeInsets.only(left: 38.0),
                              child: new RaisedButton(
                                  onPressed: _login,
                                  color: Colors.redAccent,
                                  child: new Text(
                                    "Login",
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 16.9),
                                  )),
                            ),

                            new Container(
                              margin: new EdgeInsets.only(left: 120.0),
                              child: new RaisedButton(
                                  onPressed: _erase,
                                  color: Colors.redAccent,
                                  child: new Text(
                                    "Clear",
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 16.9),
                                  )),
                            )
                          ],
                        ))
                      ],
                    )),
                new Center(
                    child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: new Text(_welcomeString,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 19.4,
                              fontWeight: FontWeight.w500)),
                      margin: new EdgeInsets.only(top: 20.0),
                    )
                  ],
                ))
              ],
            )));
  }
}
