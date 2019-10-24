import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:mazhab/helper/api.dart';

class MazhabModel {
  int id;
  String mazhab;
  String kodeMazhab;
  String createdAt;
  String updatedAt;

  MazhabModel({this.id, this.mazhab, this.kodeMazhab, this.createdAt, this.updatedAt});

  MazhabModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mazhab = json['mazhab'];
    kodeMazhab = json['kode_mazhab'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mazhab'] = this.mazhab;
    data['kode_mazhab'] = this.kodeMazhab;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  static Future<List<MazhabModel>> getAllMazhab() async {
    final response = await http.get(Api.url('mazhab'));
    if(response.statusCode == 200) {

      final json = convert.jsonDecode(response.body);
      final mazhab = json['data'];
      List<MazhabModel> data = new List();
      mazhab.forEach((d) {
        data.add(new MazhabModel.fromJson(d));
      });

      return data;

    }else{
      throw Exception("Failed to get data, error code: ${response.statusCode}");
    }
  }

  static Future<String> addMazhab(String kode, String mazhab) async {
    final response = await http.post(Api.url("mazhab"), body: {
      'kodemazhab': kode,
      'mazhab': mazhab
    });

    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];
    }else{
      return "Failed to add data, status code: ${response.statusCode}";
    }
  }

  static Future<String> editMazhab(int id, String kode, String mazhab) async {
    final response = await http.put(Api.url("mazhab/$id"), body: {
      'kodemazhab': kode,
      'mazhab': mazhab
    });

    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];
    }else{
      return "Failed to edit data, status code: ${response.statusCode}";
    }
  }

  static Future<String> deleteMazhab(int id) async {
    final response = await http.delete(Api.url("mazhab/$id"));

    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];
    }else{
      return "Failed to edit data, status code: ${response.statusCode}";
    }

  }
}