class Usuario {
  const Usuario({required this.nome, required this.idade});

  final String nome;
  final int idade;
}

class MongoDatabase {
  void salvar(dynamic item) {
    print('Armazenando no MongoDB...');
  }
}

class UsuarioRepositorio {
  final database = MongoDatabase();

  void adicionar(Usuario usuario) {
    database.salvar(usuario);
  }
}

void main() {
  final usuario = Usuario(nome: 'John', idade: 30);

  final usuarioRepositorio = UsuarioRepositorio();
  usuarioRepositorio.adicionar(usuario);
}