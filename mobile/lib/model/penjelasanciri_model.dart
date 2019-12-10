import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:mazhab/helper/api.dart';

class PenjelasanCiriModel {
  int ciriid;
  int mazhabid;
  String ciri;
  String mazhab;
  String penjelasan;

  PenjelasanCiriModel({this.ciriid, this.mazhabid, this.ciri, this.mazhab, this.penjelasan});

  PenjelasanCiriModel.fromJson(Map<String, dynamic> json) {
    ciriid = json['ciriid'];
    mazhabid = json['mazhabid'];
    ciri = json['ciri'];
    mazhab = json['mazhab'];
    penjelasan = json['penjelasan'];
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