import 'package:flutter/material.dart';
import 'package:mazhab/model/mazhab_model.dart';
import 'package:mazhab/helper/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Mazhab extends StatefulWidget {
  @override
  _MazhabState createState() => _MazhabState();
}

class _MazhabState extends State<Mazhab> {

  List<MazhabModel> listmazhab = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  void getData() {
    MazhabModel.getAllMazhab().then((data) {
      setState(() {
        listmazhab = data;
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
        title: Text("Mazhab"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => MazhabForm(title: "Tambah Mazhab")));

          if(refresh) {
            getData();
          }
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: (listmazhab.length == 0) ? Center(child: Text("No Data")) : ListView.builder(
          itemCount: listmazhab.length,
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
              final bool res = Utils.alert(context, "Warning!", "Are you sure want to delete this data?", [
                FlatButton(child: Text("Ok"), onPressed: () {
                  MazhabModel.deleteMazhab(listmazhab[i].id).then((res) {
                    Fluttertoast.showToast(msg: res);
                    listmazhab.removeAt(i);
                    Navigator.pop(context, true);
                    getData();
                  }).catchError((e) {
                    Utils.alert(context, "Warning!", e.toString(), [
                      FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                    ]);
                  });
                }),
                FlatButton(child: Text("Cancel"), onPressed: () => Navigator.pop(context, false))
              ]);

              return res;
            },
            child: ListTile(
              title: Text("${listmazhab[i].mazhab}"),
              leading: Icon(Icons.list),
              subtitle: Text("${listmazhab[i].kodeMazhab}"),
              trailing: Icon(Icons.arrow_right),
              onTap: () async {
                final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => MazhabForm(title: "Edit Mazhab", mazhab: listmazhab[i])));

                if(refresh) {
                  getData();
                }
              }
            ),
          )
        ),
      ),
    );
  }
}

class MazhabForm extends StatefulWidget {
  
  final String title;
  final MazhabModel mazhab;

  MazhabForm({Key key, @required this.title, this.mazhab}) : super(key: key);

  @override
  _MazhabFormState createState() => _MazhabFormState();
}

class _MazhabFormState extends State<MazhabForm> {

  final _formKey = GlobalKey<FormState>();
  String _kodemazhab;
  String _mazhab;
  String _biografi;

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
                  initialValue: (widget.mazhab == null) ? null : widget.mazhab.kodeMazhab,
                  decoration: InputDecoration(
                    labelText: "Kode Mazhab"
                  ),
                  validator: (input) => (input.isEmpty) ? "Kode is required." : null,
                  onSaved: (input) => _kodemazhab = input,
                ),
                Divider(height: 10, color: Colors.transparent),
                TextFormField(
                  initialValue: (widget.mazhab == null) ? null : widget.mazhab.mazhab,
                  decoration: InputDecoration(
                    labelText: "Mazhab"
                  ),
                  validator: (input) => (input.isEmpty) ? "Mazhab is required" : null,
                  onSaved: (input) => _mazhab = input,
                ),
                Divider(height: 10, color: Colors.transparent),
                TextFormField(
                  maxLines: 5,
                  initialValue: (widget.mazhab == null) ? null : widget.mazhab.biografi,
                  decoration: InputDecoration(
                    labelText: "Biografi"
                  ),
                  validator: (input) => (input.isEmpty) ? "Biografi is required" : null,
                  onSaved: (input) => _biografi = input,
                ),
                Divider(height: 10, color: Colors.transparent),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        if(widget.mazhab == null) {
                          MazhabModel.addMazhab(_kodemazhab, _mazhab, _biografi).then((res) {
                            Fluttertoast.showToast(msg: res);
                            Navigator.pop(context, true);
                          }).catchError((e) {
                            Utils.alert(context, "Warning!", e.toString(), [
                              FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                            ]);
                          });
                        }else{
                          MazhabModel.editMazhab(widget.mazhab.id, _kodemazhab, _mazhab, _biografi).then((res) {
                            Fluttertoast.showToast(msg: res);
                            Navigator.pop(context, true);
                          }).catchError((e) {
                            Utils.alert(context, "Warning!", e.toString(), [
                              FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                            ]);
                          });
                        }
                      }
                    },
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