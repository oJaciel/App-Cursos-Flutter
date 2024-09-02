import 'dart:convert';

import 'package:appmobile/core/constants.dart';
import 'package:appmobile/model/course_model.dart';
import 'package:http/http.dart' as http;

class courseRepository {
  final Uri url = Uri.parse('$urlBaseApi/courses');

  //Buscando a lista de todos os cursos na API
  Future<List<CourseEntity>> getAll() async {
    List<CourseEntity> courseList = [];

    final response = await http.get(url);
    if (response.statusCode == 200) {
      //Convertendo JSON para lista
      final json = jsonDecode(response.body) as List;

      for (var course in json) {
        courseList.add(CourseEntity.fromJson(course));
      }
    }
    return courseList;
  }

  //Adicionando novo curso
  postNewCourse(CourseEntity courseEntity) async {
    final json = jsonEncode(CourseEntity.toJson(courseEntity));
    var response = await http.post(url, body: json);
    if (response.statusCode != 201) {
      throw 'Problema ao inserir curso';
    }
  }

  //Editando curso existente
  putUpdateCourse(CourseEntity courseEntity) async {
    final url = "$urlBaseApi/courses/${courseEntity.id}";
    final json = jsonEncode(CourseEntity.toJson(courseEntity));
    var response = await http.put(Uri.parse(url), body: json);
    if (response.statusCode != 200) {
      throw 'Problemas ao atualizar o curso';
    }
  }
}
