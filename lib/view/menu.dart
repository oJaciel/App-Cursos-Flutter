import 'package:appmobile/view/holiday_page.dart';
import 'package:appmobile/view/home_page.dart';
import 'package:appmobile/view/login_page.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text("Menu")),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text("Cursos"),
            //Navegar para tela de cursos
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text("Feriados"),
            //Navegar para tela de feriados
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HolidayPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Sair"),
            //Navegar para login com push replacement
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          )
        ],
      ),
    );
  }
}
