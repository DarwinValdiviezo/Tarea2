import 'package:flutter/material.dart';
import 'pantallas/bienvenida_pantalla.dart';

void main() {
  runApp(EjerciciosMatematicosApp());
}

class EjerciciosMatematicosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios Matemáticos',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: PantallaBienvenida(),
    );
  }
}
