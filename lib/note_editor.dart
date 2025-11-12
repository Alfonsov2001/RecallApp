import 'package:flutter/material.dart';

class NoteEditorPantalla extends StatefulWidget {
  final String? initialTitle;
  const NoteEditorPantalla({super.key, this.initialTitle});

  @override
  State<NoteEditorPantalla> createState() => _NoteEditorPantallaState();
}

class _NoteEditorPantallaState extends State<NoteEditorPantalla> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    // Si se pasa un título inicial, estamos editando
    _titleController = TextEditingController(text: widget.initialTitle ?? 'Nueva Nota');
    _contentController = TextEditingController(text: widget.initialTitle != null ? 'Contenido existente de ${widget.initialTitle}' : '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determinar si estamos creando o editando
    final bool isEditing = widget.initialTitle != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar ${widget.initialTitle}' : 'Crear Nueva Nota'),
        backgroundColor: const Color.fromARGB(255, 87, 87, 87),
        foregroundColor: Colors.white,
        actions: [
          // Botón Guardar
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Lógica para guardar la nota y volver a Home
              Navigator.pop(context);
            },
          ),
          // Botón Eliminar (solo si estamos editando)
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Lógica para eliminar la nota
                Navigator.pop(context);
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo Título
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Selector de Categoría (usando la lista del Sidebar)
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Categoría'),
              value: _selectedCategory,
              items: ['Trabajo', 'Recetas', 'Estudio', 'Recordatorios']
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Campo Contenido (expandido para la nota)
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null, // Permite múltiples líneas
                expands: true, // Ocupa todo el espacio disponible
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  labelText: 'Contenido de la nota...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}