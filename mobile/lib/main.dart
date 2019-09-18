import 'package:flutter/material.dart';
import 'login.dart';

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
      home: Mainmenu(),
    );
  }
}

class Mainmenu extends StatefulWidget {
  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                color: Colors.green,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/img/search.png"),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text("CEK MAZHAB!", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Image.asset("assets/img/konsultasi.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text("Konsultasi", style: TextStyle(fontSize: 24),),
                          )
                        ],
                      ),
                    ),
                    Divider(height: 20, color: Colors.transparent,),
                    RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Image.asset("assets/img/about.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text("Info", style: TextStyle(fontSize: 24),),
                          )
                        ],
                      ),
                    ),
                    Divider(height: 20, color: Colors.transparent,),
                    RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      onPressed: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset("assets/img/login.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text("Login", style: TextStyle(fontSize: 24),),
                          )
                        ],
                      ),
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
}