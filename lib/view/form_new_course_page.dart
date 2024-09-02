import 'package:appmobile/controller/course_controller.dart';
import 'package:appmobile/model/course_model.dart';
import 'package:flutter/material.dart';

class formNewCoursePage extends StatefulWidget {
//Variável que recebe o parâmetro passado
  final CourseEntity? courseEdit;

  formNewCoursePage({super.key, this.courseEdit});

  @override
  State<formNewCoursePage> createState() => _formNewCoursePageState();
}

class _formNewCoursePageState extends State<formNewCoursePage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController textNameController = TextEditingController();
  TextEditingController textDescriptionController = TextEditingController();
  TextEditingController textStartAtController = TextEditingController();

  courseController controller = courseController();

  postNewCourse() async {
    try {
      await controller.postNewCourse(CourseEntity(
          name: textNameController.text,
          description: textDescriptionController.text,
          startAt: textStartAtController.text));
      //
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Curso inserido com sucesso."),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
        ),
      );
    }
  }

  //Verificando se tem parâmetros passados, para quando montar a tela preencher os campos
  @override
  void initState() {
    if (widget.courseEdit != null) {
      textNameController.text = widget.courseEdit?.name ?? "";
      textDescriptionController.text = widget.courseEdit?.description ?? "";
      textStartAtController.text = widget.courseEdit?.startAt ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Formulário de Curso",
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            // Nome do curso
                            TextFormField(
                              controller: textNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Nome obrigatório";
                                }
                                return null;
                              },
                              maxLength: 50,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                  hintText: "Digite o nome do curso"),
                            ),
                            const SizedBox(height: 10),

                            // Descrição
                            TextFormField(
                              controller: textDescriptionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Descrição obrigatória';
                                }
                                return null;
                              },
                              maxLength: 200,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  hintText: "Digite a descrição"),
                            ),
                            const SizedBox(height: 10),

                            // Data de Início
                            TextFormField(
                              controller: textStartAtController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Data obrigatória';
                                }
                                return null;
                              },
                              maxLength: 8,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                  hintText: "Digite a data de início"),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),

                      // Botão Salvar
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              postNewCourse();
                            }
                          },
                          child: const Text("Salvar"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
