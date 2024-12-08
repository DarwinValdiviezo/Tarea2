import 'package:flutter/material.dart';
import '../logica/ascii_logica.dart';

class AsciiPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tablaAscii = generarTablaAscii();

    return Scaffold(
      appBar: AppBar(
        title: Text("Tabla ASCII"),
        backgroundColor: Color(0xFF6B4EFF),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/ascii.png',
              height: 150,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tablaAscii.length,
              itemBuilder: (context, index) {
                final fila = tablaAscii[index];
                final caracter = _obtenerCaracterVisible(fila['caracter']);
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        "${fila['codigo']}",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    title: Text(
                      caracter,
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text("Código: ${fila['codigo']}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Método para manejar caracteres no imprimibles
  String _obtenerCaracterVisible(String caracter) {
    final int codigo = caracter.codeUnitAt(0);
    if (codigo < 32 || (codigo > 126 && codigo < 160)) {
      return "Carácter no imprimible";
    }
    return caracter;
  }
}
