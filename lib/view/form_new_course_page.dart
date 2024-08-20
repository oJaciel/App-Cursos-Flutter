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
          //TODO
          //Validações do Form
          //Colocar placeholders
          //Pesquisar sobre como fazer o teclado subir
          //Implementar no controller função que busque as duas primeiras letras de cada curso e colocar nos icons
          key: formKey,
          child: Column(
            children: [
              TextFormField(),
              const SizedBox(height: 10,),
              TextFormField(),
              const SizedBox(height: 10,),
              TextFormField(),
              const SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 48,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: const Text("Salvar")
                  )
                )
            ],
          ),
        ),
      ),
    );
  }
}
