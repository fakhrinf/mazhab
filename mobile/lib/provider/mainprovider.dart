import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  
  bool _islog = false;

  setIsLog(bool log) => this._islog = log;
  getIsLog() => _islog;

  void update(){
    notifyListeners();
  }

}