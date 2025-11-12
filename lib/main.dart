import 'package:flutter/material.dart';
import 'auth.dart'; // Contiene Login y Registro

void main() {
  runApp(const RecallApp());
}

class RecallApp extends StatelessWidget {
  const RecallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recall App',
      theme: ThemeData(
        // Color base gris oscuro para el tema general
        colorSchemeSeed: const Color.fromARGB(255, 94, 94, 94), 
        useMaterial3: true,
      ),
      home: const PantallaBienvenida(),
    );
  }
}

class PantallaBienvenida extends StatelessWidget {
  const PantallaBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logotipo y Título (Simulados)
            const Text('Logotipo Recall', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 80),
            const Text('Bienvenido a su aplicación de confianza', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            // Botón que navega a la pantalla de Login
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPantalla(),
                  ),
                );
              },
              // Estilos del botón simulando el mockup
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: Colors.grey),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Empezar a crear'),
            ),
          ],
        ),
      ),
      // Footer (Base de la página)
      bottomNavigationBar: Container(
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
      ),
    );
  }
}