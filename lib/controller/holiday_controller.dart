import 'package:appmobile/model/holiday_model.dart';
import 'package:appmobile/model/holiday_repository.dart';

class HolidayController {
  //Instanciando a variável do repository
  HolidayRepository repository = HolidayRepository();

  //Função para fazer get dos feriados
  Future<List<HolidayEntity>> getHolidayList() async {
    List<HolidayEntity> list = await repository.getAll();
    return list;
  }
  
}
