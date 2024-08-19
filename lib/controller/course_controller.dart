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
}
