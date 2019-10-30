import 'package:mazhab/model/mazhab_model.dart';

class TagSearchService {
  static Future<List> getSuggestions(List<MazhabModel> mazhab, String query) async {
    await Future.delayed(Duration(milliseconds: 400), null);
    List<dynamic> tagList = <dynamic>[];
    mazhab.forEach((data) {
      tagList.add({'name' : data.mazhab, 'value': data.id});
    });
    List<dynamic> filteredTagList = <dynamic>[];
    if (query.isNotEmpty) {
      filteredTagList.add({'name': query, 'value': 0});
    }
    for (var tag in tagList) {
      if (tag['name'].toLowerCase().contains(query)) {
        filteredTagList.add(tag);
      }
    }
    return filteredTagList;
  }
}