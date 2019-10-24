import 'package:flutter/material.dart';
import 'model/category_model.dart';
import 'helper/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  
  List<CategoryModel> listcategory = new List();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void getData() {
  CategoryModel.getCategories().then((data) {
      
      setState(() => listcategory = data );
    
    }).catchError((e) {
      Utils.alert(context, "Warning!", e.getMessage(), [
        FlatButton(
          child: Text("Ok"),
          onPressed: () => {},
        )
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryForm(title: "Tambah Kategori")));
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryForm(title: "Tambah Kategori")));

          if(refresh) {
            getData();
          }
        },
      ),
      body: Container(
        child: (listcategory.length == 0) ? Center(child: Text("No Data")) : ListView.builder(
          itemCount: listcategory.length,
          itemBuilder: (context, i) => Dismissible(
            direction: DismissDirection.startToEnd,
            key: Key(i.toString()),
            confirmDismiss: (direction) async {
              final bool res = await Utils.alert(context, "Warning!", "Are you sure want to delete this data?", [
                FlatButton(child: Text("Ok"), onPressed: () {
                  CategoryModel.deleteCategory(listcategory[i].id).then((res) {
                    listcategory.removeAt(i);
                    Fluttertoast.showToast(msg: res);
                    Navigator.pop(context, false);
                    getData();
                  }).catchError((e) {
                    Utils.alert(context, "Warning!", e.toString(), [
                      FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context, false)),
                    ]);
                  });
                }),
                FlatButton(child: Text("Cancel"), onPressed: () => Navigator.pop(context, false)),
              ]);

              return res;
            },
            background: Container(color: Colors.red, padding: EdgeInsets.all(8), child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft),
            child: ListTile(
              title: Text(listcategory[i].category),
              leading: Icon(Icons.list),
              trailing: Icon(Icons.arrow_right),
              onTap: () async {
                final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryForm(title: "Edit Kategori", category: listcategory[i])));

                // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryForm(title: "Edit Kategori")));

                if(refresh) {
                  getData();
                }
              } 
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryForm extends StatefulWidget {

  final String title;
  final CategoryModel category;

  CategoryForm({Key key, @required this.title, this.category}) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {

  final _formKey = GlobalKey<FormState>();
  String _category;


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
                initialValue: (widget.category == null || widget.category.category.isEmpty) ? null : widget.category.category,
                decoration: InputDecoration(
                  labelText: "Kategori"
                ),
                validator: (value) => (value.isEmpty) ? "Category cannot be empty!" : null,
                onSaved: (value) => setState(() => _category = value ),
              ),
              Divider(height: 10, color: Colors.transparent),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    if(_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      
                      if(widget.category == null) {
                        CategoryModel.addCategory(_category).then((res) {
                          Fluttertoast.showToast(msg: res);
                          Navigator.pop(context, true);
                        }).catchError((e) {
                          Utils.alert(context, "Warning!", e.toString(), [
                            FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context, false))
                          ]);
                        });
                      }else{
                        CategoryModel.editCategory(widget.category.id, _category).then((res) {
                          Fluttertoast.showToast(msg: res);
                          Navigator.pop(context, true);
                        }).catchError((e) {
                          Utils.alert(context, "Warning!", e.toString(), [
                            FlatButton(child: Text("Ok"), onPressed: () => Navigator.pop(context, false))
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
    );
  }
}