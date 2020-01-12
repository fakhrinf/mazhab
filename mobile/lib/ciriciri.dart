import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
          final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => CiriFormBuilder(title: "Tambah Ciri-Ciri", mazhablist: listMazhab, categorylist: listCategory)));

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
                final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => CiriFormBuilder(title: "Edit Ciri-ciri", mazhablist: listMazhab, categorylist: listCategory, ciricirimodel: listciri[i])));

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
  final CiriciriModel ciriciri;

  CiriciriForm({Key key, @required this.title, @required this.mazhablist, @required this.categorylist, this.ciriciri}) : super(key: key);

  @override
  _CiriciriFormState createState() => _CiriciriFormState();
}

class _CiriciriFormState extends State<CiriciriForm> {

  final _formKey = GlobalKey<FormState>();
  int categoryindex = 0;

  String _kodeciri;
  String _ciri;
  int _categoryid;
  String _mazhabid;

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
                  validator: (value) => (value.isEmpty) ? "Kode is required!" : null,
                  onSaved: (value) => setState(() => _kodeciri = value),
                ),
                Divider(height: 10, color: Colors.transparent),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Ciri-Ciri",
                  ),
                  validator: (value) => (value.isEmpty) ? "Ciri-ciri is required" : null,
                  onSaved: (value) => setState(() => _ciri = value),
                ),
                Divider(height: 10, color: Colors.transparent),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Kategori",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ),
                DirectSelect(
                  child: Card(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Text(widget.categorylist[categoryindex].category),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                  ),
                  itemExtent: 65.0,
                  selectedIndex: categoryindex,
                  items: widget.categorylist.map((data) => SizedBox(
                    height: 60,
                    child: Padding(child: Container(
                      child: Text(data.category),
                      alignment: Alignment.center,
                    ), padding: EdgeInsets.all(16)),
                  )).toList(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      categoryindex = index;
                      _categoryid = widget.categorylist[categoryindex].id;
                      print(widget.categorylist[categoryindex].category);
                    });
                  },
                ),                
                Divider(height: 10, color: Colors.transparent),
                FlutterTagging(
                  textFieldDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Mazhab",
                      labelText: "Masukan Mazhab"),
                  addButtonWidget: _buildAddButton(),
                  chipsColor: Colors.blueAccent,
                  chipsFontColor: Colors.white,
                  deleteIcon: Icon(Icons.cancel,color: Colors.white),
                  chipsPadding: EdgeInsets.all(2.0),
                  chipsFontSize: 14.0,
                  chipsSpacing: 5.0,
                  chipsFontFamily: 'helvetica_neue_light',
                  suggestionsCallback: (pattern) async {
                    return await TagSearchService.getSuggestions(widget.mazhablist, pattern);
                  },
                  onChanged: (result) {
                    print("TAGRESULT: $result");
                    // tag result convert to implode string.
                  },
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        if(widget.ciriciri == null){
                          // CiriciriModel.addCiriCiri(_kodeciri, _ciri, _categoryid, _mazhabid).then((res) {
                          //   Fluttertoast.showToast(msg: res);
                          //   Navigator.pop(context, true);
                          // }).catchError((e) {
                          //   Utils.alert(context, "Warning!", e.toString(), [
                          //     FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                          //   ]);
                          // });
                        }else{
                          // CiriciriModel.editCiriCiri(widget.ciriciri.id, _kodeciri, _ciri, _categoryid, _mazhabid).then((res) {
                          //   Fluttertoast.showToast(msg: res);
                          //   Navigator.pop(context, true);
                          // }).catchError((e) {
                          //   Utils.alert(context, "Warning!", e.toString(), [
                          //     FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                          //   ]);
                          // });
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

class CiriFormBuilder extends StatefulWidget {
  
  final CiriciriModel ciricirimodel;
  final String title;
  final List<MazhabModel> mazhablist;
  final List<CategoryModel> categorylist;

  CiriFormBuilder({Key key, this.title, this.ciricirimodel, this.mazhablist, this.categorylist});

  @override
  _CiriFormBuilderState createState() => _CiriFormBuilderState();
}

class _CiriFormBuilderState extends State<CiriFormBuilder> {
  
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Future.value(false);
        Navigator.pop(context, false);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title), leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        )),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            FormBuilder(
              key: _fbKey,
              autovalidate: true,
              initialValue: {
                'kodeciri': (widget.ciricirimodel == null) ? null : widget.ciricirimodel.kodeCiriciri,
                'ciriciri': (widget.ciricirimodel == null) ? null : widget.ciricirimodel.ciriciri,
                'kategori': (widget.ciricirimodel == null) ? null : widget.ciricirimodel.categoryId,
                'mazhab': (widget.ciricirimodel == null) ? null : widget.ciricirimodel.mazhab
              },
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                    child: FormBuilderTextField(
                      attribute: "kodeciri",
                      decoration: InputDecoration(labelText: "Kode Ciri"),
                      validators: [
                        FormBuilderValidators.required(errorText: "Kode ciri tidak boleh kosong!"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                    child: FormBuilderTextField(
                      attribute: "ciriciri",
                      decoration: InputDecoration(labelText: "Ciri-ciri"),
                      validators: [
                        FormBuilderValidators.required(errorText: "Ciri ciri tidak boleh kosong!"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                    child: FormBuilderDropdown(
                      attribute: "kategori",
                      decoration: InputDecoration(labelText: "Kategori"),
                      // initialValue: 'Male',
                      hint: Text('Pilih kategori'),
                      validators: [FormBuilderValidators.required()],
                      items: widget.categorylist.map((cat) => DropdownMenuItem(
                        value: cat.id,
                        child: Text(cat.category),
                      )).toList()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                    child: FormBuilderCheckboxList(
                      decoration:
                      InputDecoration(labelText: "Mazhab"),
                      attribute: "mazhab",
                      options: widget.mazhablist.map((mazhab) => FormBuilderFieldOption(value: mazhab.id, label: mazhab.mazhab)).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RaisedButton(
                color: Colors.green,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("SIMPAN", style: TextStyle(color: Colors.white)),
                  width: double.infinity,
                ),
                onPressed: () {
                  if(_fbKey.currentState.saveAndValidate()) {
                    // print(_fbKey.currentState.value);

                    Map<String, dynamic> formdata = ({
                      "ciriid": (widget.ciricirimodel != null) ? widget.ciricirimodel.id.toString() : "",
                      "kodeciri": _fbKey.currentState.value['kodeciri'].toString(),
                      "ciriciri": _fbKey.currentState.value['ciriciri'].toString(),
                      "kategori": _fbKey.currentState.value['kategori'].toString(),
                      "mazhab": _fbKey.currentState.value['mazhab'].join(","),
                    });

                    // print(formdata);
                    if(widget.ciricirimodel != null) {
                      CiriciriModel.editCiriCiri(formdata).then((res) {
                        Fluttertoast.showToast(msg: res);
                        Navigator.pop(context, true);
                      }).catchError((e) {
                        Utils.alert(context, "Error", e.toString(), [
                          FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                        ]);
                      });
                    }else{
                      CiriciriModel.addCiriCiri(formdata).then((res) {
                        Fluttertoast.showToast(msg: res);
                        Navigator.pop(context, true);
                      }).catchError((e) {
                        Utils.alert(context, "Error", e.toString(), [
                          FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                        ]);
                      });
                    }
                  }
                },
              ),
            )
          ])
        ),
      ),
    );
  }
}