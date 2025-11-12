// widgets/sidebar.dart

import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25, // 25% del ancho de la pantalla
      color: const Color.fromARGB(255, 87, 87, 87),
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 1. Perfil e Icono
          const Icon(Icons.account_circle, size: 50, color: Colors.white),
          const SizedBox(height: 30),

          // 2. Opciones Principales
          _buildMenuItem('Inicio'),
          _buildMenuItem('Mis notas'),
          _buildMenuItem('Favoritos'),
          const SizedBox(height: 40),

          // 3. Categoría (Título)
          const Text(
            'Categoría',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // 4. Lista de Categorías (Simulando los botones del mockup)
          _buildCategoryButton('Trabajo', isSelected: true),
          _buildCategoryButton('Recetas'),
          _buildCategoryButton('Salud/Hábitos'),
          _buildCategoryButton('Estudio'),
          _buildCategoryButton('Animales'),
          _buildCategoryButton('Compra'),
          _buildCategoryButton('Recordatorios'),
          
          const Spacer(), // Empuja el logo al final

          // 5. Logo Recall
          const Text('Logo Recall', style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryButton(String title, {bool isSelected = false}) {
    return Container(
      width: 120, // Ancho fijo para simular el tamaño del mockup
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54, width: 1),
        color: isSelected ? Colors.black38 : Colors.transparent, // Resaltar si está seleccionada
      ),
      child: TextButton(
        onPressed: () {
          // Acción de filtrar notas
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}