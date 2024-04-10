class Retangulo {
  Retangulo(this.largura, this.altura);

  int largura, altura;

  void setLargura(int largura) => this.largura = largura;
  void setAltura(int altura) => this.altura = altura;

  int calcularArea() => largura * altura;
}

class Quadrado extends Retangulo {
  Quadrado(int lado) : super(lado, lado);

  @override
  void setLargura(int largura) {
    super.setLargura(largura);
    super.setAltura(largura);
  }

  @override
  void setAltura(int altura) {
    super.setLargura(altura);
    super.setAltura(altura);
  }
}

void aumentarLargura(Retangulo retangulo) {
  retangulo.setLargura(retangulo.largura + 1);
}

void main() {
  final retangulo = Retangulo(10, 20);
  final quadrado = Quadrado(10);

  print(retangulo.calcularArea());
  print(quadrado.calcularArea());

  aumentarLargura(retangulo);
  aumentarLargura(quadrado);

  print(retangulo.calcularArea());
  print(quadrado.calcularArea());
}
