import 'package:appmobile/model/course_model.dart';
import 'package:appmobile/model/course_repository.dart';
import 'package:intl/intl.dart';

class courseController {
  //Instanciando variável do repositório
  courseRepository repository = courseRepository();

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

  postNewCourse(CourseEntity courseEntity) async {
    try {
      await repository.postNewCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  putUpdateNewCourse(CourseEntity courseEntity) async {
    try {
      await repository.putUpdateCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  deleteCourse(String id) async {
    try {
      await repository.deleteCourse(id);
    } catch (e) {
      rethrow;
    }
  }

  //Função para formatar data do DatePicker
  dateTimeFormatToStringPtBR(DateTime dateSelected) {
    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(dateSelected);
  }
}
