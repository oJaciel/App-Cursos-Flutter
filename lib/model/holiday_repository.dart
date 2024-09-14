import 'dart:convert';

import 'package:appmobile/core/constants.dart';
import 'package:appmobile/model/holiday_model.dart';
import 'package:http/http.dart' as http;

class HolidayRepository {
  //Função para captar o ano do sistema
  String getYear() {
    DateTime currentDate = DateTime.now();
    return currentDate.year.toString();
  }

  // Função para construir a URL incluindo o ano do sistema
  Uri getUrl() {
    String year = getYear();
    return Uri.parse('$urlHolidayApi/$year');
  }

  //Buscando os feriados na API
  Future<List<HolidayEntity>> getAll() async {
    List<HolidayEntity> holidayList = [];

    final response = await http.get(getUrl());
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      for (var holiday in json) {
        holidayList.add(HolidayEntity.fromJson(holiday));
      }
    }
    return holidayList;
  }
}
