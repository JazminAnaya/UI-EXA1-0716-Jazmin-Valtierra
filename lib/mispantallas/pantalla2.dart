import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF), // Fondo azul muy pálido como la imagen
      
      // AppBar con Menú Hamburguesa decorativo y iconos
      appBar: AppBar(
        title: const Text("Menu Cinepolis"),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF4A78D3), // Color del título (azul oscuro)
        elevation: 0,
        leading: const Icon(Icons.menu, color: Color(0xFF4A78D3)), // --- MENU HAMBURGUESA AZUL ---
        actions: const [
          Icon(Icons.notifications_none), // Icono de action 1
          SizedBox(width: 15),
          Icon(Icons.search), // Icono de action 2
          SizedBox(width: 15),
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi Jazmin,", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF4A78D3))),
            const Text("Escoge tu función hoy", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            
            // Grid de botones cuadrados (2 filas de 3 botones)
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  // Mismos iconos y textos que la imagen, pero con temática de cine
                  _btnMenu(Icons.local_movies, "Estrenos", const Color(0xFF6391F2)), // Azul
                  _btnMenu(Icons.fastfood, "Snacks", const Color(0xFF6391F2)), // Azul
                  _btnMenu(Icons.chair, "VIP", const Color(0xFF6391F2)), // Azul
                  _btnMenu(Icons.confirmation_num, "Promo", const Color(0xFFFF7B88)), // Rosa Coral
                  _btnMenu(Icons.wallet, "Pagos", const Color(0xFFFF7B88)), // Rosa Coral
                  _btnMenu(Icons.person, "Perfil", const Color(0xFFFF7B88)), // Rosa Coral
                ],
              ),
            ),
            
            // --- BOTÓN "Ir a Cartelera" SUBIDO (con espaciado) ---
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7B88), // Coral
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/pantalla3'),
                child: const Text("Ir a Cartelera", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 30), // Espacio extra abajo para que no se pegue al bottom bar
          ],
        ),
      ),
      
      // --- BARRA DE NAVEGACIÓN INFERIOR (Bottom Bar) ---
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Para mostrar los 4 iconos
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF4C82EE), // Azul como en la imagen
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false, // Sin etiquetas como la imagen
        showUnselectedLabels: false,
        currentIndex: 0, // El primer ícono está seleccionado por defecto
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''), // Icono 1
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''), // Icono 2
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: ''), // Icono 3
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: ''), // Icono 4
        ],
      ),
    );
  }

  // Helper para crear los botones cuadrados del menú
  Widget _btnMenu(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}