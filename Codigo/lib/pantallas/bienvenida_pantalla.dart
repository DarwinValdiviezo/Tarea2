import 'package:flutter/material.dart';
import 'menu_pantalla.dart';

class PantallaBienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate, color: Colors.deepPurple, size: 100),
            SizedBox(height: 20),
            Text(
              '¡Bienvenido a Ejercicios Matemáticos!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPantalla()),
                );
              },
              child: Text('Empezar'),
            ),
          ],
        ),
      ),
    );
  }
}
