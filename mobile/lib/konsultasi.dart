import 'package:flutter/material.dart';
import 'helper/naivebayes.dart';

class Konsultasi extends StatefulWidget {
  @override
  _KonsultasiState createState() => _KonsultasiState();
}

class _KonsultasiState extends State<Konsultasi> {
  
  @override
  void initState() {
    // TODO: implement initState
    NaiveBayes.calculate([1,2,3,4,5]);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konsultasi")),
      body: Center(child: Container(
        child: Text("TEST DATA"),
      )),
    );
  }
}