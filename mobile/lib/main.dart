import 'package:flutter/material.dart';
import 'package:mazhab/about.dart';
import 'package:mazhab/category.dart';
import 'package:mazhab/ciriciri.dart';
import 'package:mazhab/login.dart';
import 'package:mazhab/mazhab.dart';
import 'package:mazhab/provider/mainprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => MainProvider())
      ],
      child: MaterialApp(
        title: 'Mazhab',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Mainmenu(),
      ),
    );
  }
}

class Mainmenu extends StatefulWidget {
  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {

  Future<bool> checklog() async {
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.getBool("islog");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklog().then((res) {
      final provider = Provider.of<MainProvider>(context);
      provider.setIsLog(res);
      provider.update();
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<MainProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.6, 0.7],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.green[200],
                    Colors.green[500],
                    Colors.green[600],
                  ],
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/img/search.png"),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text("CEK MAZHAB!", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Column(
                children: <Widget>[
                  if(provider.getIsLog()) RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Category())),
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/img/mazhab.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text("Kategori", style: TextStyle(fontSize: 24),),
                        )
                      ],
                    ),
                  ),
                  if(provider.getIsLog()) Divider(height: 20, color: Colors.transparent,),
                  if(provider.getIsLog()) RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Mazhab())),
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/img/mazhab.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text("Mazhab", style: TextStyle(fontSize: 24),),
                        )
                      ],
                    ),
                  ),
                  if(provider.getIsLog()) Divider(height: 20, color: Colors.transparent,),
                  if(provider.getIsLog()) RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Ciriciri())),
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/img/ciriciri.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text("Ciri-Ciri", style: TextStyle(fontSize: 24),),
                        )
                      ],
                    ),
                  ),
                  if(provider.getIsLog()) Divider(height: 20, color: Colors.transparent,),
                  if(provider.getIsLog()) RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/img/penjelasan.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text("Penjelasan Hasil", style: TextStyle(fontSize: 24),),
                        )
                      ],
                    ),
                  ),
                  if(provider.getIsLog()) Divider(height: 20, color: Colors.transparent,),
                  RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/img/konsultasi.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text("Konsultasi", style: TextStyle(fontSize: 24),),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 20, color: Colors.transparent,),
                  RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => About())),
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/img/about.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text("Info", style: TextStyle(fontSize: 24),),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 20, color: Colors.transparent,),
                  RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onPressed: () {
                      if(provider.getIsLog()){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Alert"),
                            content: Text("Are you sure want to logout?"),
                            actions: <Widget>[
                              FlatButton(child: Text("Cancel"), onPressed: () => Navigator.pop(context)),
                              FlatButton(child: Text("Ok"), onPressed: () async {
                                SharedPreferences pref = await SharedPreferences.getInstance();
                                
                                pref.clear();

                                provider.setIsLog(false);
                                provider.update();
                                Navigator.pop(context);
                              })
                            ],
                          ) 
                        );
                      }else{
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage()));
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        (provider.getIsLog()) ? Image.asset("assets/img/logout.png") : Image.asset("assets/img/login.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text((provider.getIsLog()) ? "Logout" : "Login", style: TextStyle(fontSize: 24),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}