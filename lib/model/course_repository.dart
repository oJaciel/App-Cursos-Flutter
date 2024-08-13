import 'package:appmobile/core/constants.dart';
import 'package:appmobile/model/course_model.dart';
import 'package:http/http.dart' as http;

class courseRepository {
  final Uri url = Uri.parse('$urlBaseApi/course');

  Future<List<courseEntity>> getAll() {
    final response = http.get(url);
  }
}
