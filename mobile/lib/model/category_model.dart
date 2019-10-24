import 'package:http/http.dart' as http;
import 'package:mazhab/helper/api.dart';
import 'dart:convert' as convert;

class CategoryModel {
  int id;
  String category;
  String createdAt;
  String updatedAt;

  CategoryModel({this.id, this.category, this.createdAt, this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  static Future<List<CategoryModel>> getCategories() async {
    final response = await http.get(Api.url('category'));
    if(response.statusCode == 200) {
      List<CategoryModel> data = new List();
      final json = convert.jsonDecode(response.body);
      final category = json['data'];
      category.forEach((e) {
        data.add(new CategoryModel.fromJson(e));
      });

      return data;
    }else{
      throw Exception("Failed load data.");
    }
  }

  static Future<String> addCategory(String category) async {
    final response = await http.post(Api.url('category'), body: {
      category: category
    });
    
    if(response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data['message'];
    }else{
      return "Failed to add data, status code: ${response.statusCode}";
    }
  }

  static Future<String> editCategory(int id, String category) async {
    final response = await http.put(Api.url('category/$id'), body: {
      category: category
    });
    
    if(response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data['message'];
    }else{
      return "Failed to add data, status code: ${response.statusCode}";
    }
  } 

  static Future<String> deleteCategory(int id) async {
    final response = await http.delete(Api.url("category/$id"));
    if(response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data['message'];
    }else{
      return "Failed to add data, status code: ${response.statusCode}";
    }
  }
}