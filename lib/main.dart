import 'package:flutter/material.dart';
import 'package:front_feridacare/screens/forgot_my_password_screen.dart';
import 'package:front_feridacare/screens/my_request.dart';
import 'package:front_feridacare/screens/new_assessment_screen.dart';
import 'package:front_feridacare/screens/notificacoes_page.dart';
import 'package:front_feridacare/screens/order_view_screen.dart';
import 'package:front_feridacare/screens/salvar_page.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';

void main() {
  // Registra o AuthController antes de inicializar o app
  Get.put(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Define a tela inicial como login
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/newassessment', page: () => SolicitacaoAvaliacaoPage()),
        GetPage(name: '/orderview', page: () => VisualizarPedidosPage()),
        GetPage(name: '/forgotmypassword', page: () => EsqueceuSenhaPage()),
        GetPage(name: '/notificacoes', page: () => NotificacoesPage()),
        GetPage(name: '/salvar', page: () => SalvarPage()),
        GetPage(name: '/myrequest', page: () => MinhasSolicitacoesPage()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}
