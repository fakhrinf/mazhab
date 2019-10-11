import 'package:flutter/material.dart';

class Ciriciri extends StatefulWidget {
  @override
  _CiriciriState createState() => _CiriciriState();
}

class _CiriciriState extends State<Ciriciri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ciri-Ciri"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CiriciriForm(title: "Tambah Ciri-ciri"))),
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) => Dismissible(
            key: Key(i.toString()),
            background: Container(
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Icon(Icons.delete_forever, color: Colors.white),
              color: Colors.red,
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            child: ListTile(
              title: Text("Ciri $i"),
              leading: Icon(Icons.list),
              subtitle: Text("CODE"),
              trailing: Icon(Icons.arrow_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CiriciriForm(title: "Edit Ciri-ciri"))),
            ),
          )
        ),
      ),
    );
  }
}

class CiriciriForm extends StatefulWidget {
  
  final String title;

  CiriciriForm({Key key, @required this.title}) : super(key: key);

  @override
  _CiriciriFormState createState() => _CiriciriFormState();
}

class _CiriciriFormState extends State<CiriciriForm> {

  final _formKey = GlobalKey<FormState>();

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