import 'package:flutter/material.dart';
import '../logica/factorial_logica.dart';

class FactorialPantalla extends StatefulWidget {
  @override
  _FactorialPantallaState createState() => _FactorialPantallaState();
}

class _FactorialPantallaState extends State<FactorialPantalla> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = "";

  void _calcular() {
    final n = int.tryParse(_controller.text);
    if (n == null || n < 0) {
      setState(() => _resultado = "Por favor ingrese un número válido.");
    } else {
      final factorial = calcularFactorial(n);
      setState(() => _resultado = "Factorial de $n: $factorial");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factorial'),
        backgroundColor: Color(0xFF6B4EFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/factorial.png',
                height: 150,
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Número para calcular factorial",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calculate, color: Colors.deepPurple),
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
                "Calcular",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
