import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mazhab/model/penjelasanciri_model.dart';
import 'package:mazhab/helper/utils.dart';

class PenjelasanPage extends StatefulWidget {
  @override
  _PenjelasanPageState createState() => _PenjelasanPageState();
}

class _PenjelasanPageState extends State<PenjelasanPage> {
  
  List<Penjelasan> listpenjelasan = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    Penjelasan.getAllPenjelasan().then((data) {
      setState(() {
        listpenjelasan = data;
      });
    }).catchError((e) {
      Utils.alert(context, "Error", e.toString(), [
        FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
      ]);
    }); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Penjelasan ciri-ciri")),
      body: ListView.builder(
        itemCount: listpenjelasan.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormPenjelasan(penjelsan: listpenjelasan[i]))),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text("Mazhab: ${listpenjelasan[i].mazhab}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text("Ciri-Ciri:\n${listpenjelasan[i].ciri}"),
                  ),
                  Divider(height: 2, color: Colors.black45),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Html(data: "Penjelsan: <br/>${listpenjelasan[i].penjelasan}", defaultTextStyle: TextStyle(color: Colors.black54)),
                  ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class FormPenjelasan extends StatefulWidget {

  final Penjelasan penjelsan;

  FormPenjelasan({Key key, this.penjelsan});

  @override
  _FormPenjelasanState createState() => _FormPenjelasanState();
}

class _FormPenjelasanState extends State<FormPenjelasan> {

  final _formkey = GlobalKey<FormState>();
  String _penjelasan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit penjelasan")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _formkey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text("Mazhab: \n${widget.penjelsan.mazhab}"),
              Divider(height: 20, color: Colors.transparent,),
              Text("Ciri-ciri: \n${widget.penjelsan.ciri}", style: TextStyle(
                height: 1.5
              )),
              Divider(height: 20, color: Colors.transparent,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Penjelsan"),
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
                validator: (input) => (input.isEmpty) ? "Penjelasan cannot be empty" : null,
                initialValue: widget.penjelsan.penjelasan,
                onSaved: (value) => setState(() => _penjelasan = value),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  if(_formkey.currentState.validate()){
                    _formkey.currentState.save();

                    widget.penjelsan.setPenjelasan(_penjelasan);
                    Penjelasan.updatePenjelasan(widget.penjelsan).then((res) {
                      Fluttertoast.showToast(msg: res);
                      Navigator.pop(context);
                    }).catchError((e) {
                      Utils.alert(context, "Error", e.toString(), [
                        FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context))
                      ]);
                    });
                  }
                },
                child: Container(child: Text("UPDATE", style: TextStyle(color: Colors.white),), width: double.infinity, alignment: Alignment.center,),
              )
            ]),
          ),
        ),
      ),
    );
  }
}