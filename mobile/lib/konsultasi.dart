import 'package:flutter/material.dart';
import 'package:mazhab/helper/utils.dart';
import 'helper/naivebayes.dart';
import 'package:mazhab/model/ciricategory_model.dart';

class Konsultasi extends StatefulWidget {
  @override
  _KonsultasiState createState() => _KonsultasiState();
}

class _KonsultasiState extends State<Konsultasi> {
  
  List<CiriCategoryModel> listciricategory = new List();
  List<int> selectedciriid = new List();

  @override
  void initState() {
    // TODO: implement initState
    // NaiveBayes.calculate([1,2,3,4,5]);

    CiriCategoryModel.getallciricategories().then((res) {
      setState(() => listciricategory = res);
    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konsultasi")),
      bottomSheet: Container(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          color: Colors.green,
          onPressed: () {
            if(selectedciriid.length == 0) {
              Utils.alert(context, "Warning!", "You need to select some symtoms", [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () => Navigator.pop(context),
                )
              ]);
            }else{

            }
          },
          child: Text("Calculate", style: TextStyle(color: Colors.white),),
        ),
      ),
      body: Center(child: Container(
        child: ListView.builder(
          itemCount: listciricategory.length,
          itemBuilder: (builder, i) => ciriCiri(listciricategory[i]),
        )
      )),
    );
  }

  Widget ciriCiri(CiriCategoryModel ciri) {
    return ExpansionTile(
      leading: Icon(Icons.book),
      title: Text(ciri.category, textAlign: TextAlign.center,),
      children: ciri.ciri.map((ciriciri) => ListTile(
        title: Text(ciriciri.ciriciri),
        leading: Icon(Icons.list),
        onTap: () {
          print(ciriciri.id);
        },
      )).toList()
    );
  }
}