abstract interface class IUsuarioPerfil {
  void login();
  void logout();
  void registrar();
  void update();
}

class UsuarioPassageiro implements IUsuarioPerfil {
  @override
  void login() {
    print('Logado como passageiro');
  }

  @override
  void logout() {
    print('Deslogado como passageiro');
  }

  @override
  void registrar() {
    print('Registrado como passageiro');
  }

  @override
  void update() {
    print('Atualizado perfil');
  }
}

class UsuarioFuncionario implements IUsuarioPerfil {
  @override
  void login() {
    print('Logado como funcionário');
  }

  @override
  void logout() {
    print('Deslogado como funcionário');
  }

  @override
  void registrar() {
    // Registro não é suportado para funcionários no app.
    throw UnimplementedError();
  }

  @override
  void update() {
    print('Atualizado perfil');
  }
}