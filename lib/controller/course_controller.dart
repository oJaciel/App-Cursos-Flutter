import 'package:appmobile/model/course_model.dart';
import 'package:appmobile/model/course_repository.dart';

class courseController {
  //Instanciando variável do repositório
  courseRepository repository = courseRepository();

  Future<List<courseEntity>> getCourseList() async {
    List<courseEntity> list = await repository.getAll();
    //Aqui poderia alterar, formatar, implementar regras na lista
    return list;
  }

  //Função para preencher avatar dos cursos
  String getCourseAvatar(courseEntity course) {
    //Captando nome do curso
    var avatarName = course.name;
    //Se nome do curso estiver vazio, retorna 'NA'
    if (avatarName!.isEmpty) {
      return "NA";
    } else {
      //Se não estiver vazio, retorna as duas primeiras letras
      return avatarName!.substring(0, 2).toUpperCase();
    }

    
  }
}
