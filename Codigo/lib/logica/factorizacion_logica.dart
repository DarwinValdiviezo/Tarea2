Map<int, int> factorizarNumero(int n) {
  Map<int, int> factores = {};
  int factor = 2;

  while (n > 1) {
    int potencia = 0;
    while (n % factor == 0) {
      potencia++;
      n ~/= factor;
    }
    if (potencia > 0) {
      factores[factor] = potencia;
    }
    factor++;
  }
  return factores;
}
