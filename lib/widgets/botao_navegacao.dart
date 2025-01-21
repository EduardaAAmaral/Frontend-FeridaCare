import 'package:flutter/material.dart';
import 'package:front_feridacare/screens/notificacoes_page.dart';
import 'package:front_feridacare/screens/salvar_page.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de rotas para as páginas correspondentes
  final List<String> _pages = [
    '/PesquisarPage',
    '/SalvarPage',
    '/NotificacoesPage',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Get.toNamed(_pages[index]); // Navega para a página correspondente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Navigator(
            onGenerateRoute: (settings) => GetPageRoute(
              settings: settings,
              page: () => Get.currentRoute == '/PesquisarPage'
                  ? HomeScreen()
                  : Get.currentRoute == '/SalvarPage'
                      ? SalvarPage()
                      : NotificacoesPage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Salvar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
        ],
      ),
    );
  }
}
