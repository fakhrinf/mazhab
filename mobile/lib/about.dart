import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Image.asset("assets/img/search.png"),
                Divider(height: 10, color: Colors.transparent,),
                Text("CEK MAZHAB APPS"),
                Divider(height: MediaQuery.of(context).size.height * 0.1, color: Colors.transparent,),
                Text("Version: 1.0"),
                Divider(height: MediaQuery.of(context).size.height * 0.07, color: Colors.transparent,),
                Text("Icons by:"),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  child: Text("Icon8", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}