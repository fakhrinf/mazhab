import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mazhab/helper/tagsearch.dart';
import 'package:mazhab/helper/utils.dart';
import 'package:mazhab/model/category_model.dart';
import 'package:mazhab/model/ciriciri_model.dart';
import 'package:mazhab/model/mazhab_model.dart';

class Ciriciri extends StatefulWidget {
  @override
  _CiriciriState createState() => _CiriciriState();
}

class _CiriciriState extends State<Ciriciri> {

  List<CiriciriModel> listciri = new List();
  List<CategoryModel> listCategory = new List();
  List<MazhabModel> listMazhab = new List();

  @override
  void initState() {
    // TODO: implement initState
    getDataCiri();
    getDataMazhab();
    getDataCategory();
    super.initState();
  }

  void getDataCiri() {
    CiriciriModel.getCiriCiri().then((data) {
      setState(() {
        listciri = data;
      });
    }).catchError((e) {
      Utils.alert(context, "Warning!", e.toString(), [
        FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
      ]);
    });
  }

  void getDataMazhab() {
    MazhabModel.getAllMazhab().then((data) {
      setState(() {
        listMazhab = data;
      });
    }).catchError((e) {
      Utils.alert(context, "Warning!", e.toString(), [
        FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
      ]);
    });
  }

  void getDataCategory() {
    CategoryModel.getCategories().then((data) {
      setState(() {
        listCategory = data;
      });
    }).catchError((e) {
      Utils.alert(context, "Warning!", e.toString(), [
        FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ciri-Ciri"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  async {
          final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => CiriciriForm(title: "Tambah Ciri-ciri", mazhablist: listMazhab, categorylist: listCategory)));

          if(refresh) {
            getDataCiri();
          }
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: (listciri.length == 0) ? Center(child: Text("No Data")) : ListView.builder(
          itemCount: listciri.length,
          itemBuilder: (context, i) => Dismissible(
            key: Key(i.toString()),
            background: Container(
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Icon(Icons.delete_forever, color: Colors.white),
              color: Colors.red,
            ),
            direction: DismissDirection.startToEnd,
            confirmDismiss: (direction) async {
              final bool dismiss = Utils.alert(context, "Warning!", "Are you sure want to delete this data?",[
                FlatButton(child: Text("Ok"), onPressed: () {
                  CiriciriModel.deleteCiriciri(listciri[i].id).then((res) {
                    Fluttertoast.showToast(msg: res);
                    listciri.removeAt(i);
                    Navigator.pop(context, true);
                    getDataCiri();
                  }).catchError((e) {
                    Utils.alert(context, "Warning!", e.toString(), [
                      FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                    ]);
                  });
                }),
                FlatButton(child: Text("Cancel"), onPressed: () => Navigator.pop(context, false)),
              ]);

              return dismiss;
            },
            child: ListTile(
              title: Text("${listciri[i].ciriciri}"),
              leading: Icon(Icons.list),
              subtitle: Text("${listciri[i].kodeCiriciri}"),
              trailing: Icon(Icons.arrow_right),
              onTap: () async {
                final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => CiriciriForm(title: "Edit Ciri-ciri", mazhablist: listMazhab, categorylist: listCategory)));

                if(refresh) {
                  getDataCiri();
                }
              }
            ),
          )
        ),
      ),
    );
  }
}

class CiriciriForm extends StatefulWidget {
  
  final String title;
  final List<MazhabModel> mazhablist;
  final List<CategoryModel> categorylist;

  CiriciriForm({Key key, @required this.title, @required this.mazhablist, @required this.categorylist}) : super(key: key);

  @override
  _CiriciriFormState createState() => _CiriciriFormState();
}

class _CiriciriFormState extends State<CiriciriForm> {

  final _formKey = GlobalKey<FormState>();

  Widget _buildAddButton() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.pinkAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.add,
            color: Colors.white,
            size: 15.0,
          ),
          Text(
            "Add New Tag",
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kode Ciri-ciri"
                  ),
                ),
                Divider(height: 10, color: Colors.transparent),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Ciri-Ciri"
                  ),
                ),
                Divider(height: 10, color: Colors.transparent),
                
                //Category selection
                
                Divider(height: 10, color: Colors.transparent),
                FlutterTagging(
                  textFieldDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Tags",
                      labelText: "Enter tags"),
                  addButtonWidget: _buildAddButton(),
                  chipsColor: Colors.pinkAccent,
                  chipsFontColor: Colors.white,
                  deleteIcon: Icon(Icons.cancel,color: Colors.white),
                  chipsPadding: EdgeInsets.all(2.0),
                  chipsFontSize: 14.0,
                  chipsSpacing: 5.0,
                  chipsFontFamily: 'helvetica_neue_light',
                  suggestionsCallback: (pattern) async {
                    return await TagSearchService.getSuggestions(pattern);
                  },
                  onChanged: (result) {},
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    child: Text("SIMPAN", style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}