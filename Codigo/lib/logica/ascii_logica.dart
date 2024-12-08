List<Map<String, dynamic>> generarTablaAscii() {
  List<Map<String, dynamic>> tabla = [];
  for (int n = 1; n <= 255; n++) {
    String caracter = String.fromCharCode(n);
    tabla.add({"codigo": n, "caracter": caracter});
  }
  return tabla;
}
