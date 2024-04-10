abstract interface class Formato {
  int calcularArea();
}

class Retangulo implements Formato {
  Retangulo(this.largura, this.altura);

  int largura, altura;

  void setLargura(int largura) => this.largura = largura;

  void setAltura(int altura) => this.altura = altura;

  @override
  int calcularArea() => largura * altura;

}

class Quadrado extends Formato {
  Quadrado(this.lado);

  int lado;

  void setLado(int lado) => this.lado = lado;

  @override
  int calcularArea() => lado * lado;
}

void main() {
  final retangulo = Retangulo(10, 20);
  final quadrado = Quadrado(10);

  retangulo.setLargura(retangulo.largura + 1);
  quadrado.setLado(quadrado.lado + 1);

  print(retangulo.calcularArea());
  print(quadrado.calcularArea());
}
