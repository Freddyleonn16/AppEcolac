import 'package:appecolac/ui/views/pagina_quejas.dart';
import 'package:appecolac/ui/views/pagina_reclamos.dart';
import 'package:appecolac/ui/views/pagina_sugerencia.dart';
import 'package:flutter/material.dart';

class Paginainicio extends StatefulWidget {
  const Paginainicio({super.key});
  static String id = 'pagina_inicio';

  @override
  _PaginainicioState createState() => _PaginainicioState();
}

class _PaginainicioState extends State<Paginainicio> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(color: const Color.fromRGBO(244, 244, 244, 0.1)),
          imagenLogo(),
          iconoUsuario(),
          Positioned(
            top: 160,
            left: 20,
            child: cuadroTitulo(),
          ),
          Positioned(
            left: 10,
            bottom: 440,
            child: quejasBoton(context),
          ),
          Positioned(
            left: 20,
            bottom: 310,
            child: reclamosBoton(context),
          ),
          Positioned(
            left: 20,
            bottom: 160,
            child: sugerenciaBoton(context),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget imagenLogo() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Image.asset(
          'assets/images/LogoEcolac.jpg',
          width: 180,
        ),
      ),
    );
  }

  Widget iconoUsuario() {
    return const Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(top: 60, right: 20),
        child: Icon(
          Icons.account_circle,
          size: 50,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget cuadroTitulo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C4A98), Color(0xFF1F8CBB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/LogoBlanco.png',
            width: 130,
            height: 80,
          ),
          const SizedBox(width: 10),
          const Text(
            'Ayúdanos a          \n   Mejorar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget quejasBoton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(10),
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, PaginaQuejas.id);
      },
      child: Ink(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(157, 175, 206, 0.19),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 92, vertical: 12),
          child: Row(
            children: [
              Image.asset(
                "assets/images/QuejasIcono.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 30),
              const Text(
                'Quejas',
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reclamosBoton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, PaginaReclamos.id);
      },
      child: Ink(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(157, 175, 206, 0.19),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Text(
                'Reclamos',
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 30),
              Image.asset(
                "assets/images/ReclamosIcono.png",
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sugerenciaBoton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, PaginaSugerencia.id);
      },
      child: Ink(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(157, 175, 206, 0.19),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
          child: Row(
            children: [
              Image.asset(
                "assets/images/SugerenciaIcono.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 30),
              const Text(
                'Sugerencia',
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(45, 250, 250, 255),
      selectedItemColor: Colors.blue,
      unselectedItemColor: const Color.fromARGB(255, 127, 127, 127),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      iconSize: 40.0, // Ajuste del tamaño del ícono
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Historial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Cuenta',
        ),
      ],
      selectedLabelStyle: const TextStyle(fontSize: 16.0), // Tamaño de fuente del texto seleccionado
      unselectedLabelStyle: const TextStyle(fontSize: 14.0), // Tamaño de fuente del texto no seleccionado
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
