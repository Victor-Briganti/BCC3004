class Usuario {
  const Usuario({required this.nome, required this.idade});

  final String nome;
  final int idade;
}

abstract interface class IDatabase {
  void inserir(dynamic item);
}

class MongoDatabase implements IDatabase {
  @override
  void inserir(dynamic item) {
    print("Salvando no banco de dados Mongo...");
  }
}

class UsuarioRepositorio {
  UsuarioRepositorio(this.database);

  final IDatabase database;

  void adicionar(Usuario usuario) {
    database.inserir(usuario);
  }
}

void main() {
  final usuario = Usuario(nome: 'John', idade: 30);

  final usuarioRepositorio = UsuarioRepositorio(MongoDatabase());
  usuarioRepositorio.adicionar(usuario);
}
