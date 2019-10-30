import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:mazhab/helper/api.dart';

class CiriciriModel {
  int id;
  String ciriciri;
  String kodeCiriciri;
  int categoryId;
  Null createdAt;
  Null updatedAt;

  CiriciriModel(
      {this.id,
      this.ciriciri,
      this.kodeCiriciri,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  CiriciriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ciriciri = json['ciriciri'];
    kodeCiriciri = json['kode_ciriciri'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ciriciri'] = this.ciriciri;
    data['kode_ciriciri'] = this.kodeCiriciri;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  static Future<List<CiriciriModel>> getCiriCiri() async {
    final response = await http.get(Api.url("ciriciri"));

    if(response.statusCode == 200) {

      final json = convert.jsonDecode(response.body);
      final ciri = json['data'];
      List<CiriciriModel> data = new List();
      ciri.forEach((d) {
        data.add(new CiriciriModel.fromJson(d));
      });

      return data;

    }else{
      throw Exception("Failed to get data, error code: ${response.statusCode}");
    }
  }

  static Future<String> addCiriCiri(String code, String ciri, int categoryid, String mazhabid) async {
    final response = await http.post(Api.url("ciriciri"), body: {
      "code" : code,
      "ciri" : ciri,
      "categoryid" : categoryid,
      "mazhabid" : mazhabid
    });

    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];      
    }else{
      throw Exception("Failed to add data, error code: ${response.statusCode}");
    }
  }

  static Future<String> editCiriCiri(int ciriid,String code, String ciri, int categoryid, String mazhabid) async {
    final response = await http.put(Api.url("ciriciri/$ciriid"), body: {
      "code" : code,
      "ciri" : ciri,
      "categoryid" : categoryid,
      "mazhabid" : mazhabid
    });

    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];      
    }else{
      throw Exception("Failed to edit data, error code: ${response.statusCode}");
    }
  }

  static Future<String> deleteCiriciri(int id) async {
    final response = await http.delete(Api.url("ciriciri/$id"));
    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];
    }else{
      throw Exception("Failed to delete data, error code: ${response.statusCode}");
    }
  }
}