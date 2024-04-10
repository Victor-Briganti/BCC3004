abstract interface class IUsuarioPerfil {
  void login();
  void logout();
  void update();
}

abstract interface class IUsuarioPassageiro implements IUsuarioPerfil {
  void registrar();
}

abstract interface class IUsuarioFuncionario implements IUsuarioPerfil {}

class UsuarioPassageiro implements IUsuarioPassageiro {
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

class UsuarioFuncionario implements IUsuarioFuncionario {
  @override
  void login() {
    print('Logado como funcionário');
  }

  @override
  void logout() {
    print('Deslogado como funcionário');
  }

  @override
  void update() {
    print('Atualizado perfil');
  }
}
