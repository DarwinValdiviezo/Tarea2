import 'package:flutter/material.dart';
import 'package:tarea2/pantallas/ascii_pantalla.dart';
import 'package:tarea2/pantallas/factorial_pantalla.dart';
import 'package:tarea2/pantallas/factorizacion_pantalla.dart';
import 'package:tarea2/pantallas/mcd_pantalla.dart';
import 'package:tarea2/pantallas/primos_pantalla.dart';
import '../logica/mcd_logica.dart'; // Importa la lógica necesaria

class MenuPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú de Ejercicios'),
        backgroundColor: Color(0xFF6B4EFF),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text('Tabla ASCII'),
            leading: Icon(Icons.code, color: Colors.deepPurple),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AsciiPantalla()),
              );
            },
          ),
          ListTile(
            title: Text('Factorial de un número'),
            leading: Icon(Icons.calculate, color: Colors.deepPurple),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FactorialPantalla()),
              );
            },
          ),
          ListTile(
            title: Text('MCD de dos números'),
            leading: Icon(Icons.numbers, color: Colors.deepPurple),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => McdPantalla(calcularMCD: calcularMCD),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Factorización de un número'),
            leading: Icon(Icons.format_list_numbered, color: Colors.deepPurple),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FactorizacionPantalla()),
              );
            },
          ),
          ListTile(
            title: Text('Números primos'),
            leading: Icon(Icons.list_alt, color: Colors.deepPurple),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrimosPantalla()),
              );
            },
          ),
        ],
      ),
    );
  }
}
