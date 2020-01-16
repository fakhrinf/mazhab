import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:mazhab/helper/api.dart';

class CiriciriModel {
  int id;
  String ciriciri;
  String kodeCiriciri;
  int categoryId;
  List<int> mazhab;
  String createdAt;
  String updatedAt;

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
    mazhab = (json['mazhab'] != null) ? json['mazhab'].cast<int>() : [0];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ciriciri'] = this.ciriciri;
    data['kode_ciriciri'] = this.kodeCiriciri;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mazhab'] = this.mazhab;
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

  static Future<String> addCiriCiri(Map<String, dynamic> data) async {
    final response = await http.post(Api.url("ciriciri"), body: data);

    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];      
    }else{
      throw Exception("Failed to add data, error code: ${response.statusCode}, body: ${response.body}");
    }
  }

  static Future<String> editCiriCiri(Map<String, dynamic> data) async {
    String ciriid = data['ciriid'];
    print(ciriid);
    final response = await http.put(Api.url("ciriciri/$ciriid"), body: {
      "kodeciri" : data['kodeciri'],
      "ciriciri" : data['ciriciri'],
      "kategori" : data['kategori'],
      "mazhab" : data['mazhab']
    });

    if(response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      return json['message'];      
    }else{
      throw Exception("Failed to edit data, error code: ${response.statusCode}, body: ${response.body}");
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