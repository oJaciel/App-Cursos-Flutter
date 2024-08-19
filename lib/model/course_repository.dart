import 'dart:convert';

import 'package:appmobile/core/constants.dart';
import 'package:appmobile/model/course_model.dart';
import 'package:http/http.dart' as http;

class courseRepository {
  final Uri url = Uri.parse('$urlBaseApi/course');

  //Buscando a lista de todos os cursos na API
  Future<List<courseEntity>> getAll() async {
    List<courseEntity> courseList = [];

    final response = await http.get(url);
    if (response.statusCode == 200) {
      //Convertendo JSON para lista
      final json = jsonDecode(response.body) as List;

      for (var course in json) {
        courseList.add(courseEntity.fromJson(course));
      }
    }
    return courseList;
  }
}
