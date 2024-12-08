import 'package:flutter/material.dart';

class McdPantalla extends StatefulWidget {
  final Function(int, int) calcularMCD; // Recibe la lógica como parámetro

  McdPantalla({required this.calcularMCD});

  @override
  _McdPantallaState createState() => _McdPantallaState();
}

class _McdPantallaState extends State<McdPantalla> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  String _resultado = "";

  void _calcular() {
    final a = int.tryParse(_controllerA.text);
    final b = int.tryParse(_controllerB.text);

    if (a == null || b == null || a <= 0 || b <= 0) {
      setState(() => _resultado = "Por favor ingrese números válidos.");
    } else {
      final mcd =
          widget.calcularMCD(a, b); // Llama a la lógica pasada como parámetro
      setState(() => _resultado = "El MCD de $a y $b es $mcd.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCD de dos Números'),
        backgroundColor: Color(0xFF6B4EFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/mcd.png', // Reemplaza con tu imagen
                  height: 150,
                ),
              ),
              TextField(
                controller: _controllerA,
                decoration: InputDecoration(
                  labelText: "Primer número",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.filter_1, color: Color(0xFF6B4EFF)),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _controllerB,
                decoration: InputDecoration(
                  labelText: "Segundo número",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.filter_2, color: Color(0xFF6B4EFF)),
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
              Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _resultado,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
