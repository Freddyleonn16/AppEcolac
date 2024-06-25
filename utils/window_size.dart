// utils/window_size.dart
import 'dart:io';
import 'dart:ui';

Future<void> setWindowFrame(Rect frame) async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Implemente el código para establecer el tamaño de la ventana aquí
  }
}

Future<void> setWindowMinSize(Size size) async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Implemente el código para establecer el tamaño mínimo de la ventana aquí
  }
}

Future<void> setWindowMaxSize(Size size) async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Implemente el código para establecer el tamaño máximo de la ventana aquí
  }
}

Future<void> setWindowTitle(String title) async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Implemente el código para establecer el título de la ventana aquí
  }
}

Future<WindowSize> getWindowInfo() async {
  return WindowSize();
}

class WindowSize {
  Future<void> setWindowFrame(Rect frame) async {
    // Implemente el código para establecer el tamaño de la ventana aquí
  }

  Future<void> setWindowMinSize(Size size) async {
    // Implemente el código para establecer el tamaño mínimo de la ventana aquí
  }

  Future<void> setWindowMaxSize(Size size) async {
    // Implemente el código para establecer el tamaño máximo de la ventana aquí
  }

  Future<void> setWindowTitle(String title) async {
    // Implemente el código para establecer el título de la ventana aquí
  }
}
