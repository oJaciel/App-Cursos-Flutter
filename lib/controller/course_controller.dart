import 'package:appmobile/model/course_model.dart';
import 'package:appmobile/model/course_repository.dart';
import 'package:intl/intl.dart';

class courseController {
  //Instanciando variável do repositório
  courseRepository repository = courseRepository();

  //Função para fazer get dos cursos
  Future<List<CourseEntity>> getCourseList() async {
    List<CourseEntity> list = await repository.getAll();
    //Aqui poderia alterar, formatar, implementar regras na lista
    return list;
  }

  //Função para preencher avatar dos cursos
  String getCourseAvatar(CourseEntity course) {
    //Captando nome do curso
    var avatarName = course.name;
    //Se nome do curso estiver vazio, retorna 'NA'
    if (avatarName!.isEmpty) {
      return "NA";
    } else {
      //Se não estiver vazio, retorna as duas primeiras letras
      return avatarName.substring(0, 2).toUpperCase();
    }
  }

  //Função para adicionar novo curso
  postNewCourse(CourseEntity courseEntity) async {
    try {
      await repository.postNewCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  //Função para fazer update em um curso
  putUpdateNewCourse(CourseEntity courseEntity) async {
    try {
      await repository.putUpdateCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  //Função para deletar um curso
  deleteCourse(String id) async {
    try {
      await repository.deleteCourse(id);
    } catch (e) {
      rethrow;
    }
  }

  //Função para formatar data do DatePicker, DateTime para String
  dateTimeFormatToStringPtBR(DateTime dateSelected) {
    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(dateSelected);
  }

  //Função para transformar o Date para String, String para DateTime
  dateFormatStringPtBRtoAPI(String dateSelected) {
    // 05/11/2024
    String day = dateSelected.substring(0, 2);
    String month = dateSelected.substring(3, 5);
    String year = dateSelected.substring(6, 10);
    String dateFormat = '$year-$month-${day}T00:00:00.000Z';
    return dateFormat;
  }
}
