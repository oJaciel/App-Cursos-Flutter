import 'package:appmobile/controller/course_controller.dart';
import 'package:appmobile/model/course_model.dart';
import 'package:appmobile/view/form_new_course_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  courseController controller = courseController();

  late Future<List<CourseEntity>> _futureCourses;

  void navigateToForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => formNewCoursePage(),
      ),
    ).then((value) {
      _futureCourses = getCourses();
      setState(() => {});
    });
  }

  Future<List<CourseEntity>> getCourses() async {
    //Obter a lista da API
    return await controller.getCourseList();
  }

  @override
  void initState() {
    super.initState();
    _futureCourses = getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Cursos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToForm,
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _futureCourses,
        builder: (context, AsyncSnapshot<List<CourseEntity>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var course = snapshot.data![index];
                    //Variável chamando a função do controller para montar avatar
                    var avatarText = controller.getCourseAvatar(course);

                    return Card(
                      elevation: 5,
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                onPressed: (context) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            formNewCoursePage(courseEdit: snapshot.data![index]),
                                      )).then((value) {
                                        _futureCourses = getCourses();
                                        setState(() {
                                          
                                        });
                                      });
                                }),
                            SlidableAction(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                onPressed: (context) {})
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                              snapshot.data![index].name ?? "Não informado"),
                          subtitle: Text(snapshot.data![index].description ??
                              "Não informado"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          leading: CircleAvatar(
                              child: Text(avatarText) //Montando Avatar,
                              ),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
