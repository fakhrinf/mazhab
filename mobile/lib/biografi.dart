import 'package:flutter/material.dart';

class Biografi extends StatelessWidget {

  final String mazhab;
  final String biografi;

  Biografi({Key key, this.biografi, this.mazhab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biografi Imam Mazhab"),
      ),
      body: SingleChildScrollView(child: Column(children: <Widget>[
        Center(child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text("Mazhab ${this.mazhab}", style: TextStyle(
            fontSize: 24,
          )),
        )),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 24),
          child: Text(this.biografi, style: TextStyle(
            height: 2
          ),),
        )
      ])),
    );
  }
}