import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:mazhab/hasil.dart';
import 'package:mazhab/helper/utils.dart';
import 'package:mazhab/model/penjelasanciri_model.dart';
import 'helper/naivebayes.dart';
import 'package:mazhab/model/ciricategory_model.dart';

class Konsultasi extends StatefulWidget {
  @override
  _KonsultasiState createState() => _KonsultasiState();
}

class _KonsultasiState extends State<Konsultasi> {
  
  List<CiriCategoryModel> listciricategory = new List();
  List<int> selectedciriid = new List();
  bool calculateprocess = false;

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
    // final progress = ProgressHUD.of(context);
    return ProgressHUD(
      child: Builder(
        builder: (context) => Scaffold(
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
                  // setState(() => calculateprocess = true);
                  final progress = ProgressHUD.of(context);
                  progress.showWithText("Process");

                  NaiveBayes.calculate(selectedciriid).then((res) async {
                    var ids = selectedciriid.join(',');
                    List<PenjelasanCiriModel> penjelasanciri = await PenjelasanCiriModel.getPenjelasan(ids);

                    progress.dismiss();

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Hasil(hasil: res, penjelasan: penjelasanciri,)));

                    setState(() => selectedciriid.clear());
                  });
                }
              },
              child: Text("${selectedciriid.length} terpilih", style: TextStyle(color: Colors.white),),
            ),
        ),
        body: Center(child: Container(
            child: ListView.builder(
              itemCount: listciricategory.length,
              itemBuilder: (builder, i) => ciriCiri(listciricategory[i]),
            )
        )),
      ),
          ),
    );
  }

  Widget ciriCiri(CiriCategoryModel ciri) {
    bool iselected = false;
    return ExpansionTile(
      leading: Icon(Icons.book),
      title: Text(ciri.category, textAlign: TextAlign.center,),
      children: ciri.ciri.map((ciriciri) => ListTileTheme(
        selectedColor: Colors.green,
        style: ListTileStyle.list,
        child: ListTile(
          selected: (selectedciriid.contains(ciriciri.id)) ? true : false,
          title: Text(ciriciri.ciriciri),
          leading: Icon(Icons.list),
          onTap: () {
            print(ciriciri.id);
            setState(() {
              if(selectedciriid.contains(ciriciri.id)) {
                selectedciriid.removeAt(selectedciriid.indexOf(ciriciri.id));
              }else{
                selectedciriid.add(ciriciri.id);
              }
            });
          },
        ),
      )).toList()
    );
  }
}