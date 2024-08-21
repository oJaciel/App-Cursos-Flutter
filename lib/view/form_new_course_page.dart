import 'package:flutter/material.dart';

class formNewCoursePage extends StatefulWidget {
  const formNewCoursePage({super.key});

  @override
  State<formNewCoursePage> createState() => _formNewCoursePageState();
}

class _formNewCoursePageState extends State<formNewCoursePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Formulário de Curso",
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //Nome do curso
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nome obrigatório";
                  }
                  return null;
                },
                maxLength: 50,
                keyboardType: TextInputType.name,
                decoration:
                    const InputDecoration(hintText: "Digite o nome do curso"),
              ),

              const SizedBox(
                height: 10,
              ),

              //Descrição
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Descrição obrigatória';
                  }
                  return null;
                },
                maxLength: 200,
                keyboardType: TextInputType.text,
                decoration:
                    const InputDecoration(hintText: "Digite a descrição"),
              ),

              const SizedBox(
                height: 10,
              ),

              //Data de Início
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Data obrigatória';
                  }
                  return null;
                },
                maxLength: 8,
                keyboardType: TextInputType.datetime,
                decoration:
                    const InputDecoration(hintText: "Digite a data de início"),
              ),

              const SizedBox(
                height: 10,
              ),

              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () =>
                          {if (formKey.currentState!.validate()) {}},
                      child: const Text("Salvar"))),
            ],
          ),
        ),
      ),
    );
  }
}
