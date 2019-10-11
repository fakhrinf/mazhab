import 'package:flutter/material.dart';
import 'package:mazhab/provider/mainprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'helper/api.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var _title = "Sign In";
  bool _loginpage = true;
  double _textlinkpos = 550;
  final _loginkey = GlobalKey<FormState>();
  String _username;
  String _password;

  Widget loginForm(BuildContext context) {

    final provider = Provider.of<MainProvider>(context);

    return Form(
      key: _loginkey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: "Username",
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey[200], width: 1))

            ),
            validator: (val) {
              if(val.isEmpty) {
                return "Username tidak boleh kosong";
              }
            },
            onSaved: (val) {
              setState(() => _username = val);
            },
          ),
          Divider(color: Colors.transparent, height: 10,),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey[200], width: 1))
            ),
            validator: (val) {
              if(val.isEmpty){
                return "Password tidak boleh kosong";
              }
            },
            onSaved: (val) {
              setState(() => _password = val);
            },
          ),
          Divider(color: Colors.transparent, height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              padding: EdgeInsets.all(16),
              color: Colors.green,
              shape: StadiumBorder(),
              child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 14)),
              onPressed: () async {

                if(_loginkey.currentState.validate()) {
                  _loginkey.currentState.save();
                  print("$_username: $_password");
                  var response = await http.post(Api.url("login"),body: {'username': _username, 'password': _password});

                  var res = convert.jsonDecode(response.body);
                  if(response.statusCode == 200) {  
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.setBool("islog", true);
                    pref.setInt("id", res['data'][0]['id']);
                    pref.setString("username", res['data'][0]['username']);

                    provider.setIsLog(true);
                    provider.update();
                    Navigator.pop(context);
                  }else{
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Kode: ${response.statusCode}"),
                        content: Text(res['message']),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Ok"),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      )
                    );
                  }
                }
              },
            ),
          )
        ],
      )
    );
  }

  Widget registerForm() {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: "Username",
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey[200], width: 1))

            ),
          ),
          Divider(color: Colors.transparent, height: 10,),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey[200], width: 1))
            ),
          ),
          Divider(color: Colors.transparent, height: 10,),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirm Password",
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey[200], width: 1))
            ),
          ),
          Divider(color: Colors.transparent, height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              padding: EdgeInsets.all(16),
              color: Colors.green,
              shape: StadiumBorder(),
              child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 14)),
              onPressed: () => {},
            ),
          )
        ],
      )
    );
  }

  Widget linktext(bool islogin) {
    return Row(
      children: <Widget>[
        Text((islogin) ? "Don't have an account?" : "Already have an account?"),
        FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              if(islogin) {
                _loginpage = false;
                _textlinkpos = 610;
                _title = "Register";
              }else{
                _loginpage = true;
                _textlinkpos = 550;
                _title = "Sign In";
              }
            });
          },
          child: Text((islogin) ? "Register here" : "Login here", style: TextStyle(color: Colors.blue)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: 150,
                            height: 150,
                            child: CircleAvatar(
                            child: Image.asset("assets/img/search.png"),
                            backgroundColor: Colors.white,
                            radius: 16,
                          ),
                        ),
                        Divider(color: Colors.transparent, height: 10,),
                        Text(_title, style: TextStyle(color: Colors.white, fontSize: 24)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 330,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10)),
                  ]
                ),
                child: (_loginpage) ? loginForm(context) : registerForm()
              ),
            ),
          ),
          // Positioned(
          //   top: _textlinkpos,
          //   child: Container(
          //     child: linktext(_loginpage)
          //   ),
          // ),
        ],
      ),
    );
  }
}
