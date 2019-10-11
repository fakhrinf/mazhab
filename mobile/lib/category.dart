import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryForm(title: "Tambah Kategori"))),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) => Dismissible(
            direction: DismissDirection.startToEnd,
            key: Key(i.toString()),
            onDismissed: (direction) => {},
            background: Container(color: Colors.red, padding: EdgeInsets.all(8), child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft),
            child: ListTile(
              title: Text("Category Name"),
              leading: Icon(Icons.list),
              trailing: Icon(Icons.arrow_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryForm(title: "Edit Kategori"))),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryForm extends StatefulWidget {

  final String title;

  CategoryForm({Key key, @required this.title}) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Kategori"
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
    );
  }
}