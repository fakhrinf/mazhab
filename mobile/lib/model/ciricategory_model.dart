import 'package:mazhab/helper/api.dart';
import 'package:mazhab/model/ciriciri_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CiriCategoryModel {
  String category;
  List<CiriciriModel> ciri;

  CiriCategoryModel({this.category, this.ciri});

  CiriCategoryModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['ciri'] != null) {
      ciri = new List<CiriciriModel>();
      json['ciri'].forEach((v) {
        ciri.add(new CiriciriModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.ciri != null) {
      data['ciri'] = this.ciri.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<List<CiriCategoryModel>> getallciricategories() async {
    final response = await http.get(Api.url("categoryciri"));
    if(response.statusCode == 200) {
      List<CiriCategoryModel> ciricategory = new List();
      final json = convert.jsonDecode(response.body);
      final data = json['data'];
      data.forEach((res) {
        ciricategory.add(CiriCategoryModel.fromJson(res));
      });

      return ciricategory;
    }else{
      throw Exception("Failed to get data, error code: ${response.statusCode}");
    }
  }
}