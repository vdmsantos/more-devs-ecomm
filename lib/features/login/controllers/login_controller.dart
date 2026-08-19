import 'package:more_devs_do_zero/shared/models/usuario.dart';

class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int _caracterMinimoSenha = 6;

  bool isActiveCheckBox = false;
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isLoading = false;

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaValid => senha.trim().length >= _caracterMinimoSenha;

  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) return null;
    return 'E-mail inválido';
  }

  String? get senhaError {
    if (senha.isEmpty || isSenhaValid) {
      return null;
    }
    return 'Senha inválida';
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = isEmailValid && isSenhaValid;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }

  Future<Usuario> login() async {
    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'vitor6890@gmail.com' && senha == '123456') {
      //Mock do usuário retornado pela API
      return Usuario(id: '1', nome: 'Vitor', email: email);
    } else {
      throw Exception('Usuário ou senha inválidos');
    }
  }

  String? validateEmail(String? value) {
    if (_emailRegex.hasMatch(email)) {
      return null;
    }
    return 'E-mail inválido';
  }

  String? validateSenha(String? value) {
    if (senha.length >= _caracterMinimoSenha) {
      return null;
    }
    return 'Senha inválida';
  }
}
