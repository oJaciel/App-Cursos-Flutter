import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text("Menu")
            ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text("Cursos"),
            //Navegar para uma nova tela
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text("Feriados"),
            //Navegar para uma nova tela
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Sair"),
            //Navegar para login com push replacement
            onTap: () {},
          )
        ],
      ),
    );
  }
}