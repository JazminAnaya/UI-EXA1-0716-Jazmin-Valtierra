import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  // Controladores para validar que no estén vacíos
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Función de validación y navegación
  void _intentarIngresar() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // Si ambos campos tienen texto, navegamos
      Navigator.pushNamed(context, '/pantalla2');
    } else {
      // Si no, mostramos un mensaje de error (esto es bueno para la experiencia de usuario)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, llena tu e-mail y contraseña.'),
          backgroundColor: Color(0xFFFF7B88), // Color rosa de la imagen
        ),
      );
    }
  }

  @override
  void dispose() {
    // Es buena práctica liberar los controladores
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizada para esta pantalla
      appBar: AppBar(
        title: const Text("Cinepolis Valtierra Inicio"),
        backgroundColor: const Color(0xFF6391F2), // Azul claro de la imagen
        leading: const Icon(Icons.arrow_back, color: Colors.white,), // Icono de action 1
        actions: const [Icon(Icons.help_outline, color: Colors.white,), SizedBox(width: 15,)], // Icono de action 2
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          // Degradado exacto de la primera pantalla
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF90B4F6), Color(0xFF4C82EE)],
          ),
        ),
        child: SingleChildScrollView( // Para evitar errores de desbordamiento en pantallas pequeñas
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.videocam, size: 80, color: Colors.white),
                const SizedBox(height: 10),
                const Text("Hola cliente!", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                // --- TU NOMBRE Y GRUPO ---
                const Text("Jazmin Valtierra 6-I", style: TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 40),
                
                // Campos de texto con los controladores
                _buildTextField("E-mail", _emailController, false),
                const SizedBox(height: 15),
                _buildTextField("Password", _passwordController, true), // Obscure text para contraseña
                
                const SizedBox(height: 30),
                
                // Botón principal (Coral) con la lógica de validación
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7B88), // Rosa Coral de la imagen
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: _intentarIngresar, // Llama a la función de validación
                  child: const Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                
                const SizedBox(height: 25),
                
                // --- SECCIÓN DE FACEBOOK (Blanca) ---
                const Text("o regístrate con facebook", style: TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 10),
                // Botón circular blanco con icono azul (idéntico a la imagen)
                GestureDetector(
                  onTap: () {
                    // Acción decorativa para Facebook
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registro con Facebook (Decorativo)')));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))],
                    ),
                    child: const Icon(Icons.facebook, color: Color(0xFF4C82EE), size: 30),
                  ),
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper para construir los TextFields
  Widget _buildTextField(String hint, TextEditingController controller, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white60),
          filled: true,
          // FIX: Replace deprecated `Colors.white.withOpacity(0.2)` with `Color.fromRGBO`
          fillColor: Color.fromRGBO(255, 255, 255, 0.2), // Fondo semitransparente como en la imagen
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}