import 'package:appmobile/core/constants.dart';
import 'package:http/http.dart' as http;

class courseRepository {
  final Uri url = Uri.parse('$urlBaseApi/course');

  getAll() {
    final response = http.get(url);
  }
}
