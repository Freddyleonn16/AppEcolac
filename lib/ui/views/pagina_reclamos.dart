import 'package:appecolac/ui/views/resultado_pagina.dart';
import 'package:flutter/material.dart';

class PaginaReclamos extends StatefulWidget {
  const PaginaReclamos({super.key});
  static String id = 'pagina_reclamos';

  @override
  PaginaReclamosState createState() => PaginaReclamosState();
}

class PaginaReclamosState extends State<PaginaReclamos> {
  
  String? _selectedProducto;
  String? _selectedLugar;
  String _detalles = '';
  final List<String> _productos = ['Leche', 'Queso', 'Mantequilla'];
  final List<String> _lugares = ['Ruta 1', 'Ruta 2', 'Ruta 3', 'Ruta 4'];

  // Estado para la categoría seleccionada
  String _selectedCategory = 'PRODUCTO';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: const Color.fromRGBO(244, 244, 244, 0.1)),
          Positioned(
            top: 75,
            left: 20,
            child: cuadroTitulo(),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategoryIcons(),
                    const SizedBox(height: 20),
                    if (_selectedCategory == 'PRODUCTO') _buildProductoForm(),
                    if (_selectedCategory == 'VENTAS') _buildServicioForm(),
                    if (_selectedCategory == 'DISTRIBUIDOR') _buildOtrosForm(),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
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
                          Navigator.pushNamed(context, ResultadoPagina.id);
                        },
                        child: const Text(
                          'Enviar',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
            ' Reclamos       ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryIcon(Icons.shopping_bag, 'PRODUCTO'),
        _buildCategoryIcon(Icons.sell, 'VENTAS'),
        _buildCategoryIcon(Icons.bus_alert, 'DISTRIBUIDOR'),
      ],
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: _selectedCategory == label
                ? Colors.blue
                : Colors.blue.shade100,
            child: Icon(
              icon,
              size: 30,
              color: _selectedCategory == label
                  ? Colors.white
                  : Colors.blue,
            ),
          ),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: Text('Selecciona $label'),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    int maxLines = 1,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          maxLines: maxLines,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Ingrese $label',
          ),
        ),
      ],
    );
  }

  // Formulario para la categoría Producto
  Widget _buildProductoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDropdown(
          label: 'Producto',
          value: _selectedProducto,
          items: _productos,
          onChanged: (value) {
            setState(() {
              _selectedProducto = value;
            });
          },
        ),
        const SizedBox(height: 20),
        _buildTextField(label: 'Tikect/Lote (Opcional)'),
        const SizedBox(height: 20),
        _buildDropdown(
          label: 'Lugar de distribución',
          value: _selectedLugar,
          items: _lugares,
          onChanged: (value) {
            setState(() {
              _selectedLugar = value;
            });
          },
        ),
        const SizedBox(height: 20),
        _buildTextField(
          label: 'Detalles',
          maxLines: 5,
          onChanged: (value) {
            setState(() {
              _detalles = value;
            });
          },
        ),
      ],
    );
  }

  // Formulario para la categoría Servicio
  Widget _buildServicioForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(label: 'Problema'),
        const SizedBox(height: 20),
        _buildTextField(
          label: 'Detalles',
          maxLines: 10,
          onChanged: (value) {
            setState(() {
              _detalles = value;
            });
          },
        ),
      ],
    );
  }

  // Formulario para la categoría Otros
  Widget _buildOtrosForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(label: 'Distribuidor'),
        const SizedBox(height: 20),
        _buildTextField(label: 'Problema'),
        const SizedBox(height: 20),
        _buildTextField(
          label: 'Detalles',
          maxLines: 6,
          onChanged: (value) {
            setState(() {
              _detalles = value;
            });
          },
        ),
      ],
    );
  }
}
