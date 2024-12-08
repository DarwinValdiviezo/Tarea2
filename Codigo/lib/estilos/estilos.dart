import 'package:flutter/material.dart';

class Estilos {
  static const Color colorPrimario = Color(0xFF6B4EFF);

  static InputDecoration decoracionInput(String label, IconData icono) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icono, color: colorPrimario),
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorPrimario.withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorPrimario),
      ),
    );
  }

  static ButtonStyle estiloBoton = ElevatedButton.styleFrom(
    backgroundColor: colorPrimario,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    textStyle: TextStyle(fontSize: 16),
  );
}
