import 'package:flutter/material.dart';
import 'package:appecolac/ui/views/login_view.dart';
import 'package:appecolac/ui/views/resgister_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecolac App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginView.id,
      routes: {
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
      },
    );
  }
}
