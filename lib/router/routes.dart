import 'package:appecolac/ui/views/resgister_view.dart';
import 'package:appecolac/ui/views/login_view.dart';
import 'package:flutter/material.dart';

var customRoutes = <String, WidgetBuilder>{
  /// vistas de registro y login
  LoginView.id: (_) => const LoginView(),
  RegisterView.id: (_) => const RegisterView(),

  ///
};