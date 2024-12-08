import 'package:flutter/material.dart';
import '../logica/factorizacion_logica.dart';

class FactorizacionPantalla extends StatefulWidget {
  @override
  _FactorizacionPantallaState createState() => _FactorizacionPantallaState();
}

class _FactorizacionPantallaState extends State<FactorizacionPantalla> {
  final TextEditingController _controller = TextEditingController();
  List<MapEntry<int, int>> _factores = [];
  String _mensajeError = "";

  void _calcular() {
    final n = int.tryParse(_controller.text);
    if (n == null || n <= 0) {
      setState(() {
        _mensajeError = "Por favor, ingrese un número válido mayor a 0.";
        _factores = [];
      });
    } else {
      final factores = factorizarNumero(n);
      setState(() {
        _factores = factores.entries.toList();
        _mensajeError = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factorización'),
        backgroundColor: Color(0xFF6B4EFF),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Imagen decorativa
              Image.asset(
                'assets/images/factorizar.png', // Asegúrate de tener esta imagen en tu proyecto
                height: 150,
              ),
              SizedBox(height: 16),
              // Entrada de datos
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Número a factorizar",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calculate),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              // Botón para calcular
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
              // Mostrar mensaje de error si existe
              if (_mensajeError.isNotEmpty)
                Text(
                  _mensajeError,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              // Mostrar resultados si hay factores
              if (_factores.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Resultado:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _factores.length,
                      itemBuilder: (context, index) {
                        final factor = _factores[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading:
                                Icon(Icons.filter_1, color: Colors.deepPurple),
                            title: Text(
                              "Factor: ${factor.key}",
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(
                              "Potencia: ${factor.value}",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
