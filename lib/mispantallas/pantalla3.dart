import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF), // Fondo claro
      
      // AppBar con Menú Hamburguesa y iconos personalizados
      appBar: AppBar(
        title: const Text("Cartelera"),
        backgroundColor: const Color(0xFFFF7B88), // Rosa Coral (color de la tercera pantalla)
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu, color: Colors.white), // --- MENU HAMBURGUESA BLANCO ---
        actions: const [
          Icon(Icons.filter_list), // Icono de action 1
          SizedBox(width: 15),
          Icon(Icons.info_outline), // Icono de action 2
          SizedBox(width: 15),
        ],
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Explore Movies", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4A78D3))),
            const SizedBox(height: 20),
            
            // Sección de Películas Replicando el estilo de "Tours" de la imagen
            _cardPelicula("The Batman", "Un nuevo héroe surge en Gotham.", "https://raw.githubusercontent.com/JazminAnaya/UI-EXA1-0716-Jazmin-Valtierra/refs/heads/main/batman.jfif"),
            const SizedBox(height: 15),
            _cardPelicula("Avatar: El Sentido del Agua", "El regreso a Pandora.", "https://raw.githubusercontent.com/JazminAnaya/UI-EXA1-0716-Jazmin-Valtierra/refs/heads/main/avatar.jfif"),
            const SizedBox(height: 15),
            _cardPelicula("Spider-Man: No Way Home", "El multiverso se desata.", "https://raw.githubusercontent.com/JazminAnaya/UI-EXA1-0716-Jazmin-Valtierra/refs/heads/main/spiderman.jfif"),
            
            const SizedBox(height: 30),
            
            // Botón para regresar
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6391F2), // Azul
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Regresar", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper para crear las tarjetas de películas (reemplazando "Tours")
  // Usamos el diseño de RECUADRO AZUL CON TEXTO BLANCO como pediste
  Widget _cardPelicula(String titulo, String descripcion, String imgUrl) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // Degradado azul como en la sección de "Tours"
          gradient: const LinearGradient(colors: [Color(0xFF6391F2), Color(0xFF4A78D3)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Imagen decorativa (reemplaza esto por tus URLs de GitHub)
                Image.network(
                  imgUrl, 
                  width: 50, 
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Si la URL falla, mostramos un icono de respaldo
                    return const Icon(Icons.movie, size: 50, color: Colors.white70);
                  },
                ),
                const SizedBox(width: 15),
                // Texto Blanco
                Expanded(
                  child: Text(
                    titulo, 
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Texto Blanco descriptivo
            Text(descripcion, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 15),
            // Botón de acción (Coral) replicando el "Join the Tour"
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(color: const Color(0xFFFF7B88), borderRadius: BorderRadius.circular(20)),
                child: const Text("Ver Horarios", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            )
          ],
        ),
      ),
    );
  }
}