import 'package:get/get.dart';

class AuthController extends GetxController {
  // Mock para simular usuários cadastrados
  final RxList<Map<String, String>> _users = <Map<String, String>>[].obs;

  // Estado de autenticação
  final RxBool isAuthenticated = false.obs;

  // Login do usuário
  String login(String email, String password) {
    final user = _users.firstWhereOrNull(
      (user) => user['email'] == email && user['password'] == password,
    );

    if (user != null) {
      isAuthenticated.value = true;
      return "Login bem-sucedido!";
    } else {
      return "E-mail ou senha inválidos.";
    }
  }

  // Cadastro de usuário
  String register(String name, String email, String password, String text1) {
    // Verifica se o e-mail já está cadastrado
    if (_users.any((user) => user['email'] == email)) {
      return "E-mail já cadastrado.";
    }

    // Adiciona o novo usuário à lista
    _users.add({
      'name': name,
      'email': email,
      'password': password,
    });

    return "Cadastro realizado com sucesso!";
  }

  // Logout do usuário
  void logout() {
    isAuthenticated.value = false;
  }
}
