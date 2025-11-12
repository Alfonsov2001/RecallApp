import 'package:flutter/material.dart';
import 'registro.dart'; // Para navegar al registro
import 'home.dart';    // Para navegar a la Home

class LoginPantalla extends StatelessWidget {
  const LoginPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logotipo
              Image.asset('assets/logo_recall.png', height: 60),
              const SizedBox(height: 10),
              const Text('Recall', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 40),
              
              // Campo Usuario
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario:',
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 20),
              
              // Campo Contraseña
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña:',
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 30),

              // Botones de Acción
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botón Iniciar Sesión
                  ElevatedButton(
                    onPressed: () {
                      // Simular inicio de sesión exitoso
                      Navigator.pushReplacement( 
                        context,
                        MaterialPageRoute(builder: (context) => const HomePantalla()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 144, 182, 147), // Color verde
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Iniciar sesión'),
                  ),
                  const SizedBox(width: 10),
                  // Botón Crear Cuenta
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistroPantalla()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 144, 182, 147), // Color verde
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Crear cuenta'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '¿Ha olvidado su contraseña?',
                style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 87, 87, 87)),
              ),
            ],
          ),
        ),
      ),
      // Footer (igual que main.dart)
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