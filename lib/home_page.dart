import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<String>> _futureCourses;

  Future<List<String>> getCourses() async {
    //Obter a lista da API
    return Future.delayed(Duration(seconds: 10), () {
      return ['Curso 1', 'Curso 2', 'Curso 3'];
    });
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
      body: FutureBuilder(
        future: _futureCourses,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]),
                    subtitle: const Text('Subtítulo vem aqui'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const CircleAvatar(
                      child: Text('CC'),
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
