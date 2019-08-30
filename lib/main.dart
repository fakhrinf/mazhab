import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mazhab',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.1, 0.6, 0.7],
                      colors: [
                        // Colors are easy thanks to Flutter's Colors class.
                        Colors.green[200],
                        Colors.green[500],
                        Colors.green[600],
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: 150,
                            height: 150,
                            child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 16,
                          ),
                        ),
                        Divider(color: Colors.transparent, height: 10,),
                        Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 24)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 330,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10)),
                  ]
                ),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Username",
                          contentPadding: EdgeInsets.all(16),
                          filled: true,
                          fillColor: Colors.grey[100],
                          suffixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey[200], width: 1))

                        ),
                      ),
                      Divider(color: Colors.transparent, height: 10,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: EdgeInsets.all(16),
                          filled: true,
                          fillColor: Colors.grey[100],
                          suffixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey[200], width: 1))
                        ),
                      ),
                      Divider(color: Colors.transparent, height: 10,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          padding: EdgeInsets.all(16),
                          color: Colors.green,
                          shape: StadiumBorder(),
                          child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 14)),
                          onPressed: () => {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 560,
            child: Container(
              child: Row(
                children: <Widget>[
                  Text("Belum punya akun?"),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => {},
                    child: Text("Daftar disini", style: TextStyle(color: Colors.blue)),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
