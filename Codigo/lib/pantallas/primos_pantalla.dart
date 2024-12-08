import 'package:flutter/material.dart';
import '../logica/primos_logica.dart';

class PrimosPantalla extends StatefulWidget {
  @override
  _PrimosPantallaState createState() => _PrimosPantallaState();
}

class _PrimosPantallaState extends State<PrimosPantalla> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = "";

  void _calcular() {
    final limite = int.tryParse(_controller.text);
    if (limite == null || limite < 3) {
      setState(
          () => _resultado = "Por favor ingrese un número mayor o igual a 3.");
    } else {
      final primos = generarNumerosPrimos(limite);
      setState(() => _resultado = "Primos: ${primos.join(", ")}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Números Primos'),
        backgroundColor: Color(0xFF6B4EFF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/primos.png', // Imagen representativa
              height: 150,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Límite superior",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6B4EFF),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Generar",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            if (_resultado.isNotEmpty)
              Card(
                margin: const EdgeInsets.all(16.0),
                color: Colors.deepPurple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _resultado,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
