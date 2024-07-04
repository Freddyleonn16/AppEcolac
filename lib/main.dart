import 'package:appecolac/ui/views/pagina_quejas.dart';
import 'package:appecolac/ui/views/pagina_reclamos.dart';
import 'package:appecolac/ui/views/pagina_sugerencia.dart';
import 'package:appecolac/ui/views/resultado_pagina.dart';
import 'package:flutter/material.dart';
import 'package:appecolac/ui/views/login_view.dart';
import 'package:appecolac/ui/views/resgister_view.dart';
import 'package:appecolac/ui/views/login_user.dart';
import 'package:appecolac/ui/views/pagina_inicio.dart';

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
        LoginUser.id: (context) => const LoginUser(),
        Paginainicio.id: (context) => const Paginainicio(),
        PaginaQuejas.id: (context) => const PaginaQuejas(),
        ResultadoPagina.id: (context) => const ResultadoPagina(),
        PaginaReclamos.id: (context) => const PaginaReclamos(),
        PaginaSugerencia.id: (context) => const PaginaSugerencia(),
      },
    );
  }
}
