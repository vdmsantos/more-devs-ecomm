class LoginController {
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static const int _senhaMinLength = 6;

  bool isActiveCheckBox = false;
  String email = '';
  String senha = '';
  bool isActiveButton = false;

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaValid => senha.length >= _senhaMinLength;

  String? validateEmail(String? value) {
    final emailValue = value?.trim() ?? '';
    if (emailValue.isEmpty) return 'Informe o e-mail';
    if (!_emailRegex.hasMatch(emailValue)) return 'E-mail inválido';
    return null;
  }

  String? validateSenha(String? value) {
    final senhaValue = value ?? '';
    if (senhaValue.isEmpty) return 'Informe a senha';
    if (senhaValue.length < _senhaMinLength) {
      return 'A senha deve ter no mínimo $_senhaMinLength caracteres';
    }
    return null;
  }

  void changeActiveButton() {
    isActiveButton = isEmailValid && isSenhaValid;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }
}
