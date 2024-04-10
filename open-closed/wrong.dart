class PizzaPedido {
  void pedido() {
    print("Pedido de pizza");
  }
}

class MarmitaPedido {
  void pedido() {
    print("Pedido de marmita");
  }
}

class PedidoServico {
  void pedido(dynamic pedido) {
    if (pedido is PizzaPedido) {
      pedido.pedido();
    } else if (pedido is MarmitaPedido) {
      pedido.pedido();
    } else {
      throw Exception('Pedido desconhecido');
    }
  }
}

void main() {
  PizzaPedido pizza = PizzaPedido();
  MarmitaPedido marmita = MarmitaPedido();

  PedidoServico pedidoServico = PedidoServico();

  pedidoServico.pedido(pizza);
  pedidoServico.pedido(marmita);
}
