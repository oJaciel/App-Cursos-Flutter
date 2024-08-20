import 'package:appmobile/controller/course_controller.dart';
import 'package:appmobile/model/course_model.dart';
import 'package:appmobile/view/form_new_course_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  courseController controller = courseController();

  late Future<List<courseEntity>> _futureCourses;

  void navigateToForm() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => formNewCoursePage(),
        ));
  }

  Future<List<courseEntity>> getCourses() async {
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
        builder: (context, AsyncSnapshot<List<courseEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].name ?? "Não informado"),
                    subtitle: Text(
                        snapshot.data![index].description ?? "Não informado"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const CircleAvatar(
                      child: Text('CC'), //TODO
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
