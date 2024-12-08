List<int> generarNumerosPrimos(int limite) {
  List<int> primos = [];
  for (int n = 3; n <= limite; n++) {
    bool esPrimo = true;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) {
        esPrimo = false;
        break;
      }
    }
    if (esPrimo) {
      primos.add(n);
    }
  }
  return primos;
}
