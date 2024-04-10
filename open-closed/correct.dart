abstract class IPedidoMetodo {
  void pedido();
}

class PizzaPedido implements IPedidoMetodo {
  @override
  void pedido() {
    print('Pedido de pizza');
  }
}

class MarmitaPedido implements IPedidoMetodo {
  @override
  void pedido() {
    print('Pedido de marmita');
  }
}

class PedidoServico {
  void solicita(IPedidoMetodo pedidoMetodo) {
    pedidoMetodo.pedido();
  }
}

void main() {
  final pedidoServico = PedidoServico();
  pedidoServico.solicita(MarmitaPedido());
  pedidoServico.solicita(PizzaPedido());
}