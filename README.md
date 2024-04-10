# Principios SOLID em DART

Este é um repositório dedicado ao curso de Engenharia de Software(BCC3004) da UTFPR(Universidade Tecnológica Federal do Paraná).
O objetivo deste é trazer 4 principíos SOLID e exclicá-los usando uma linguagem de programção, no caso a escolhida foir Dart.

Os principios que são demonstrados neste repositório são:

1. **Princípio da Inversão de Dependência (DIP):** Este princípio estabelece que os módulos de alto nível não devem depender diretamente dos módulos de baixo nível. Em vez disso, ambos os níveis devem depender de abstrações. Isso promove um maior desacoplamento entre os diferentes componentes de um sistema, facilitando a manutenção, extensão e teste de cada módulo de forma independente.

2. **Princípio da Segregação de Interfaces (ISP):** O ISP afirma que as interfaces devem ser específicas para os clientes que as utilizam, evitando interfaces "gordas" que contêm mais funcionalidades do que o necessário. Isso ajuda a evitar que os clientes dependam de métodos ou comportamentos que não precisam, promovendo uma melhor modularidade e evitando acoplamento excessivo.

3. **Princípio Aberto-Fechado (OCP):** O OCP postula que as entidades de software devem ser abertas para extensão, mas fechadas para modificação. Isso significa que, ao adicionar novas funcionalidades, você não deve precisar alterar o código existente, mas sim estender seu comportamento através de mecanismos como herança, polimorfismo ou composição. Isso promove um código mais robusto, flexível e de fácil manutenção.

4. **Princípio da Substituição de Liskov (LSP):** O LSP enfatiza que objetos de uma superclasse devem poder ser substituídos por objetos de suas subclasses sem que o comportamento esperado do programa seja alterado. Em outras palavras, as subclasses devem ser substituíveis por suas superclasses em qualquer lugar do código, garantindo consistência e previsibilidade no sistema. Isso é fundamental para a correta aplicação de herança e polimorfismo.

### Princípio da Inversão de Dependência (DIP)

Este princípio estabelece que os módulos de alto nível não devem depender diretamente dos módulos de baixo nível. Em vez disso, ambos os níveis devem depender de abstrações. Isso promove um desacoplamento entre os diferentes componentes do sistema, aumentando a flexibilidade, reutilização e manutenção do código. Ao aderir ao DIP, as mudanças nos módulos de baixo nível não devem impactar os módulos de alto nível, permitindo que diferentes implementações possam ser facilmente substituídas sem alterar o comportamento dos módulos de alto nível.

O [primeiro código](dependency-inversion/wrong.dart) possui a classe `UsuarioRepositorio`, onde há um método que salva o usuário no banco de dados. É possível perceber que o DIP está sendo violado nesta classe devido o acesso direto ao banco de dados o que a torna dependente de uma classe concreta. Isso torna o código menos flexível e mais difícil de manter, pois qualquer mudança na implementação do banco de dados exigiria modificações na classe UsuarioRepositorio.

Quando olhamos para a [correção](dependency-inversion/correct.dart) temos a implementação da interface `IDatabase` que abstrai essa conexão com o banco de dados. Isso permite que diferentes implementações de banco de dados possam ser facilmente substituídas sem impactar o código do `UsuarioRepositorio`, seguindo assim o DIP.

### Princípio da Segregação de Interfaces (ISP)

Este princípio enfatiza que as interfaces devem ser específicas e não devem forçar as classes a implementar métodos que não precisam. Em vez disso, as interfaces devem ser segregadas para atender às necessidades específicas das classes que as implementam. Isso promove um design mais coeso e modular, reduzindo o acoplamento entre as classes e tornando o código mais flexível e fácil de manter. Em essência, o ISP busca garantir que as classes sejam responsáveis apenas pelos métodos que realmente precisam implementar.

No [primeiro código](interface-segregation/wrong.dart), temos a interface `IUsuarioPerfil`, que contém alguns métodos CRUD que são disponibilizados aos usuários. No entanto, há um problema quando olhamos para a classe `UsuarioFuncionario`. O registro de usuário não deve ser feito por essa classe, mas por outra parte do sistema. Nesse caso, como a classe está implementando a interface, ela não pode deixar de implementar o método `registrar`, mesmo que seja algo que não pode ser usado. Isso torna o código confuso e pode trazer problemas para futuros contribuidores que não saibam dessa regra de negócio.

No [código corrigido](interface-segregation/correct.dart), a interface é dividida em duas subinterfaces: `IUsuarioPassageiro` e `IUsuarioFuncionario`. Dessa forma, não apenas temos uma divisão mais clara entre as classes do sistema, como também é possível gerenciar o que cada interface deve ou não implementar sem quebrar o princípio da segregação de interface.

### Princípio Aberto-Fechado

Este princípio enfatiza que as interfaces devem estar abertas para extensão, mas fechadas para modificação. Isso significa que você pode adicionar novas funcionalidades sem precisar alterar o código existente, tornando o software mais flexível e modular.

No [primeiro código](open-closed/wrong.dart), temos a interface `PedidoServico`, que é responsável por realizar o pedido conforme a classe passada via parâmetro. Nele, temos o seguinte bloco de código:


```dart
  void pedido(dynamic pedido) {
    if (pedido is PizzaPedido) {
      pedido.pedido();
    } else if (pedido is MarmitaPedido) {
      pedido.pedido();
    } else {
      throw Exception('Pedido desconhecido');
    }
  }
```

Neste bloco, é possível perceber que para cada novo pedido adicionado, será necessário alterar esta funcionalidade para que ela possa atender às novas demandas. Outro grande problema está no fato de que a implementação da maneira atual aceita parâmetros dinâmicos, o que força o uso de exceções, tornando o código mais instável.

Isto foi [corrigido](interface-segregation/correct.dart) utilizando uma interface padronizada com o nome `IPedidoMetodo`, que obriga a implementação do método `pedido`. Dessa forma, conseguimos melhorar o código, deixando mais claro o que é aceito e como é a interface de utilização desses pedidos. Além de remover o `if` que erá necessário para verificação de tipos.

### Princípio da Substituição de Liskov

Proposto por Barbara Liskov, este princípio enfatiza que objetos de uma classe derivada devem ser capazes de substituir objetos de uma classe base sem quebrar a integridade do programa. Em outras palavras, se S é um subtipo de T, então os objetos do tipo T podem ser substituídos por objetos do tipo S sem alterar as propriedades desejadas do programa. Isso promove a reutilização de código, facilita a manutenção e aumenta a flexibilidade do sistema.


Este princípio pode ser melhor observado ao examinarmos o [primeiro código](/liskov/wrong.dart), onde temos a classe `Retângulo` estendida pela classe `Quadrado`. À primeira vista, a extensão parece lógica, já que um quadrado é um tipo especial de retângulo. No entanto, ao analisarmos as implementações, vemos que, para que um quadrado se mantenha como um quadrado, seus lados devem sempre ter o mesmo valor. Isso requer verificações adicionais e torna as implementações de `setLargura` e `setAltura` problemáticas, pois elas precisariam alterar ambos os lados do quadrado simultaneamente. Assim temos que este código acaba por violar o princípio de substituição.

A [correção](liskov/correct.dart) deste código envolve a introdução de uma interface `Formato`, que fornece um ponto comum entre as classes `Retângulo` e `Quadrado` sem criar conflitos em suas implementações. Essa separação permite o uso contínuo das classes onde o método `calcularArea` é necessário, garantindo, ao mesmo tempo, que o manuseio do tamanho de cada formato seja tratado de forma específica em suas respectivas implementações concretas.