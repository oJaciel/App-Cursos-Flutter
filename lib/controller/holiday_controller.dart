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
  
  //Função para formatar data dos feriados para padrão pt-BR
  dateFormatStringPtBR(String dateSelected) {
    //Dado entra 2024-01-01
    //Dado sai 01/01/2024
    String day = dateSelected.substring(8, 10);
    String month = dateSelected.substring(5, 7);
    String year = dateSelected.substring(0, 4);
    String dateFormat = '$day/$month/${year}';
    return dateFormat;
  }

}
