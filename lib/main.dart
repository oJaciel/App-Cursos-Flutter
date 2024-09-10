import 'package:appmobile/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt'), // Portuguese
        Locale('en'), // English
      ],
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        )),
        inputDecorationTheme: const InputDecorationTheme(
          //Propriedades dos inputs
          errorStyle: TextStyle(color: Colors.deepPurple),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Colors.deepPurple,
            background: Colors.grey[100]),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
