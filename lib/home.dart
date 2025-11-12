import 'package:flutter/material.dart';
import 'widgets/sidebar.dart';
import 'note_editor.dart';

class HomePantalla extends StatelessWidget {
  const HomePantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          // Menú Lateral (Importado de widgets/sidebar.dart)
          const SideBarMenu(),

          // Contenido Principal (Dashboard de Notas)
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 230, 230, 230),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        // Simulación de Notas Existentes (Como se ve en la imagen)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildNoteCard(context, 'Lista compra:', ['Pan', 'Leche', 'Huevos']),
                            const SizedBox(width: 20),
                            _buildNoteCard(context, 'Perro:', ['Darle de comer', 'Veterinario']),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildNoteCard(context, 'Clase:', ['Proyecto Willman', 'Actividad Nuria', 'Actividad Carlos']),
                            const SizedBox(width: 20),
                            _buildNoteCard(context, 'Recordatorios:', ['Boda Carlos', 'Dentista Jueves', 'Médico viernes']),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Botón flotante para CREAR nueva nota
                  Positioned(
                    bottom: 70, // Ajustado para el footer
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: () {
                        // Navegar a la pantalla de edición para crear una nueva nota
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NoteEditorPantalla(),
                          ),
                        );
                      },
                      backgroundColor: const Color.fromARGB(255, 144, 182, 147),
                      foregroundColor: Colors.white,
                      child: const Icon(Icons.add, size: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Footer
      bottomNavigationBar: _buildFooter(),
    );
  }

  // Widget auxiliar para las tarjetas de notas
  Widget _buildNoteCard(BuildContext context, String title, List<String> items) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Al hacer clic, simula la EDICIÓN de la nota existente
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteEditorPantalla(initialTitle: title),
            ),
          );
        },
        child: Card(
          // ... (Estilos de la tarjeta)
          margin: EdgeInsets.zero,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Simulación de imagen (ej: imagen de pan o perro)
                Container(height: 80, color: Colors.grey[300], child: Center(child: Text('Imagen de $title'))),
                const SizedBox(height: 10),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                ...items.map((item) => Text('• $item')).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
        height: 50,
        color: const Color.fromARGB(255, 87, 87, 87),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Correo: recall@enterprise.com', style: TextStyle(color: Colors.white, fontSize: 12)),
            Text('Teléfono: 954 87 96 32', style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      );
  }
}