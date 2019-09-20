import 'package:flutter/material.dart';

class Mazhab extends StatefulWidget {
  @override
  _MazhabState createState() => _MazhabState();
}

class _MazhabState extends State<Mazhab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mazhab"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MazhabForm(title: "Tambah Mazhab")));
        },
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
              title: Text("Mazhab $i"),
              leading: Icon(Icons.list),
              subtitle: Text("CODE"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
          )
        ),
      ),
    );
  }
}

class MazhabForm extends StatefulWidget {
  
  final String title;

  MazhabForm({Key key, @required this.title}) : super(key: key);

  @override
  _MazhabFormState createState() => _MazhabFormState();
}

class _MazhabFormState extends State<MazhabForm> {

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
                    labelText: "Kode Mazhab"
                  ),
                ),
                Divider(height: 10, color: Colors.transparent),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Mazhab"
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