import 'package:flutter/material.dart';
import 'package:appecolac/ui/views/resgister_view.dart';
import 'package:appecolac/ui/views/login_user.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'login_view';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          _buildTopSection(size),
          _buildButtonSection(context, size),
          _buildGradientBackground(size),
        ],
      ),
    );
  }

  Widget _buildTopSection(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.17),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/LogoEcolac.jpg',
              width: size.width * 0.9,
            ),
            const SizedBox(height: 16),
            const Text(
              'El sabor de la pureza',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 21,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSection(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F8CBB),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.16,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, LoginUser.id);
              },
              child: const Text(
                'Iniciar Sesion',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F8CBB),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.203,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
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
    );
  }

}

  Widget _buildGradientBackground(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: TopClipper(),
        child: Container(
          height: size.height * 0.2,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1C4A98), Color(0xFF1F8CBB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }


class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, size.height * 0.25);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


