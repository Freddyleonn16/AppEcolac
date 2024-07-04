import 'package:appecolac/ui/views/login_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'register_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}

  Widget _buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(color: Colors.white),
        _buildTopSection(),
        _buildForm(),
        registrarBoton(context, size),
        _buildGradientBackground(),
      ],
    );
  }

  Widget _buildTopSection() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/images/LogoEcolac.jpg',
              width: 340,
            ),
            const Text(
              'Registrarse',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Positioned(
      left: 15,
      right: 15,
      top: 260,
      child: Column(
        children: [
          _buildTextField("Correo", false),
          const SizedBox(height: 8),
          _buildTextField("Contraseña", true),
          const SizedBox(height: 8),
          _buildTextField("Cargo", false),
          const SizedBox(height: 8),
          _buildTextField("Barrio", false),
          const SizedBox(height: 8),
          _buildTextField("Telefono Celular", false),

        ],
      ),
    );
  }

  Widget _buildTextField(String hintText, bool obscureText) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.black38,
          width: 1.5,
        ),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }


Widget registrarBoton(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 90.65),
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
                Navigator.pushNamed(context, LoginView.id);
              },
              child: const Text(
                'Registrase',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientBackground() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: TopClipper(),
        child: Container(
          height: 200,
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

