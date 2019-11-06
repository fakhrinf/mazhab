import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:mazhab/helper/api.dart';

class CiriMazhabModel {
  int id;
  int ciriid;
  int mazhabid;

  CiriMazhabModel({
      this.id,
      this.ciriid,
      this.mazhabid
  });

  CiriMazhabModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ciriid = json['ciriid'];
    mazhabid = json['mazhabid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ciriid'] = this.ciriid;
    data['mazhabid'] = this.mazhabid;
    return data;
  }

  static Future<List<CiriMazhabModel>> getCiriMazhab_byid(int ciriid, int mazhabid) async {
    final response = await http.get(Api.url("cirimazhab/$ciriid/$mazhabid"));
    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      final data = json['data'];
      List<CiriMazhabModel> cirimazhab = new List();
      data.forEach((d) {
        cirimazhab.add(new CiriMazhabModel.fromJson(d));
      });

      return cirimazhab;
    }else{
      throw Exception("Failed to get data, error code: ${response.statusCode}");
    }
  }
}