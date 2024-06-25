import 'package:flutter/material.dart';
import 'package:appecolac/ui/views/resgister_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'login_view';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/LogoEcolac.jpg', // Asegúrate de tener esta imagen en tu carpeta assets
                    width: size.width * 0.6,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'El sabor de la pureza',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.35),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C4A98),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.225,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Navegar a la vista de inicio
                      Navigator.pushNamed(context, LoginView.id);
                    },
                    child: const Text(
                      'Iniciar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C4A98),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.2,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Navegar a la vista de registro
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                    child: const Text(
                      'Registrar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Aquí añadimos el ClipPath para el fondo con degradado
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: TopClipper(), // Usamos nuestro CustomClipper
              child: Container(
                height: size.height * 0.2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1C4A98), Color(0xFF00FF00)], // Colores del degradado
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Clase CustomClipper para recortar el fondo con un círculo encima
class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75); // Linea hasta el punto superior izquierdo
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, size.height * 0.75); // Curva cuadrática hacia abajo
    path.lineTo(size.width, size.height); // Linea hasta el punto inferior derecho
    path.lineTo(0, size.height); // Linea hasta el punto inferior izquierdo (cerrando el path)
    path.close(); // Cerrar el path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No es necesario reclip
  }
}

