import 'package:flutter/material.dart';
import 'home.dart';

// --------------------- LOGIN PANTALLA ---------------------

class LoginPantalla extends StatelessWidget {
  const LoginPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    // Definición de estilo del pie de página para reutilizar
    final Widget footer = _buildFooter();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Logotipo Recall', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 40),
              
              // Campo Usuario y Contraseña (simulados)
              const _AuthTextField(labelText: 'Usuario:'),
              const SizedBox(height: 20),
              const _AuthTextField(labelText: 'Contraseña:', obscureText: true),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _AuthButton(
                    text: 'Iniciar sesión',
                    onPressed: () {
                      // Navegación exitosa a Home
                      Navigator.pushReplacement( 
                        context,
                        MaterialPageRoute(builder: (context) => const HomePantalla()),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  _AuthButton(
                    text: 'Crear cuenta',
                    onPressed: () {
                      // Navegar a la pantalla de Registro
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistroPantalla()),
                      );
                    },
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
      bottomNavigationBar: footer,
    );
  }
}

// --------------------- REGISTRO PANTALLA ---------------------

class RegistroPantalla extends StatelessWidget {
  const RegistroPantalla({super.key});

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
              const Text('Logotipo Recall', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 40),
              
              // Campos de Registro
              const _AuthTextField(labelText: 'Usuario:'),
              const SizedBox(height: 20),
              const _AuthTextField(labelText: 'Correo electrónico:'),
              const SizedBox(height: 20),
              const _AuthTextField(labelText: 'Contraseña:', obscureText: true),
              const SizedBox(height: 20),
              const _AuthTextField(labelText: 'Repita la contraseña:', obscureText: true),
              const SizedBox(height: 40),
              
              _AuthButton(
                text: 'Crear cuenta',
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                onPressed: () {
                  // Simular registro y volver a Login
                  Navigator.pop(context); 
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }
}

// --------------------- WIDGETS AUXILIARES ---------------------

class _AuthTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  const _AuthTextField({required this.labelText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  const _AuthButton({required this.text, required this.onPressed, this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 144, 182, 147),
        foregroundColor: Colors.white,
        padding: padding,
      ),
      child: Text(text),
    );
  }
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