import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:mazhab/helper/api.dart';

class PenjelasanCiriModel {
  String category;
  List<Penjelasan> penjelasan;

  PenjelasanCiriModel({this.category, this.penjelasan});

  PenjelasanCiriModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['penjelasan'] != null) {
      penjelasan = new List<Penjelasan>();
      json['penjelasan'].forEach((v) {
        penjelasan.add(new Penjelasan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.penjelasan != null) {
      data['penjelasan'] = this.penjelasan.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<List<PenjelasanCiriModel>> getPenjelasan(String ids) async {
    final response = await http.get(Api.url("ciriciri/$ids/penjelasan"));
    if(response.statusCode == 200) {

      final json = convert.jsonDecode(response.body);
      final mazhab = json['data'];
      List<PenjelasanCiriModel> data = new List();
      mazhab.forEach((d) {
        data.add(new PenjelasanCiriModel.fromJson(d));
      });

      return data;

    }else{
      throw Exception("Failed to get data, error code: ${response.statusCode}");
    }
  }
}


class Penjelasan {
  int ciriid;
  int mazhabid;
  String ciri;
  String mazhab;
  String penjelasan;

  Penjelasan({this.ciriid, this.mazhabid, this.ciri, this.mazhab, this.penjelasan});

  setPenjelasan(String _penjelasan) => penjelasan = _penjelasan;

  Penjelasan.fromJson(Map<String, dynamic> json) {
    ciriid = json['ciriid'];
    mazhabid = json['mazhabid'];
    ciri = json['ciri'];
    mazhab = json['mazhab'];
    penjelasan = (json['penjelasan'] == null || json['penjelasan'] == "") ? "-" : json['penjelasan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ciriid'] = this.ciriid;
    data['mazhabid'] = this.mazhabid;
    data['ciri'] = this.ciri;
    data['mazhab'] = this.mazhab;
    data['penjelasan'] = this.penjelasan;
    return data;
  }

  static Future<List<Penjelasan>> getAllPenjelasan() async {
    final response = await http.get(Api.url("penjelasanciri"));

    if(response.statusCode == 200) {
      final penjelasan = convert.jsonDecode(response.body);
      List<Penjelasan> data = new List();
      penjelasan['data'].forEach((d) {
        data.add(new Penjelasan.fromJson(d));
      });

      return data;
    }else{
      throw Exception("Failed to get penjelasan data");
    }
  }

  static Future<String> updatePenjelasan(Penjelasan penjelasan) async {
    final response = await http.put(Api.url("penjelasanciri"), body: {
      "ciriid": penjelasan.ciriid.toString(),
      "mazhabid": penjelasan.mazhabid.toString(),
      "penjelasan": penjelasan.penjelasan
    });

    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];
    }else{
      throw Exception("Failed update data");
    }
  }
}