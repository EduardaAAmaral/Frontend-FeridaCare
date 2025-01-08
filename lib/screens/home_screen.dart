import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authController.logout();
              Get.offAllNamed('/login'); // Redireciona para o login após logout
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Bem-vindo(a)!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
