import 'package:flutter/material.dart';
import 'package:front_feridacare/screens/home_screen.dart';
import 'package:front_feridacare/screens/notificacoes_page.dart';
import 'package:front_feridacare/screens/salvar_page.dart';

class VisualizarPedidosPage extends StatefulWidget {
  @override
  _VisualizarPedidosPageState createState() => _VisualizarPedidosPageState();
}

class _VisualizarPedidosPageState extends State<VisualizarPedidosPage> {
  final List<Map<String, dynamic>> _pedidosMock = [
    {
      'nome': 'João Silva',
      'tipo': 'Queimadura',
      'cobertura': 'Gaze Estéril',
      'status': 'Pendente',
      'selecionado': false
    },
    {
      'nome': 'Maria Oliveira',
      'tipo': 'Úlcera Venosa',
      'cobertura': 'Espuma Hidrofílica',
      'status': 'Finalizado',
      'selecionado': false
    },
    {
      'nome': 'Carlos Souza',
      'tipo': 'Ferida Cirúrgica',
      'cobertura': 'Curativo Alginato',
      'status': 'Em andamento',
      'selecionado': false
    },
    {
      'nome': 'Ana Costa',
      'tipo': 'Ferida por pressão',
      'cobertura': 'Filme Transparente',
      'status': 'Pendente',
      'selecionado': false
    },
    {
      'nome': 'Pedro Lima',
      'tipo': 'Laceração',
      'cobertura': 'Compressa de Carvão',
      'status': 'Finalizado',
      'selecionado': false
    },
    {
      'nome': 'Juliana Alves',
      'tipo': 'Úlcera Diabética',
      'cobertura': 'Hidrogel',
      'status': 'Em andamento',
      'selecionado': false
    },
    {
      'nome': 'Fernando Rocha',
      'tipo': 'Queimadura',
      'cobertura': 'Gaze Vaselinada',
      'status': 'Pendente',
      'selecionado': false
    },
    {
      'nome': 'Luiza Martins',
      'tipo': 'Ferida Traumática',
      'cobertura': 'Curativo de Prata',
      'status': 'Finalizado',
      'selecionado': false
    },
  ];

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SalvarPage(),
    NotificacoesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _selectedIndex == 0 ? _buildPedidosContent() : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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

  Widget _buildPedidosContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppBar(
            title: Text("Visualização de Pedidos"),
            backgroundColor: Colors.teal[700],
          ),
          SizedBox(height: 16), // Espaço entre o AppBar e o conteúdo
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Alinha no topo
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Visualização",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Fundo da tabela
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.teal[700]!),
                        headingTextStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        columns: [
                          DataColumn(
                            label: Checkbox(
                              value: _pedidosMock
                                  .every((pedido) => pedido['selecionado']),
                              onChanged: (bool? value) {
                                setState(() {
                                  for (var pedido in _pedidosMock) {
                                    pedido['selecionado'] = value ?? false;
                                  }
                                });
                              },
                            ),
                          ),
                          DataColumn(label: Text("Nome")),
                          DataColumn(label: Text("Tipo da ferida")),
                          DataColumn(label: Text("Cobertura")),
                          DataColumn(label: Text("Status")),
                        ],
                        rows: _pedidosMock.map((pedido) {
                          return DataRow(
                            cells: [
                              DataCell(Checkbox(
                                value: pedido['selecionado'],
                                onChanged: (bool? value) {
                                  setState(() {
                                    pedido['selecionado'] = value ?? false;
                                  });
                                },
                                activeColor: Colors.orange,
                              )),
                              DataCell(Text(pedido['nome'])),
                              DataCell(Text(pedido['tipo'])),
                              DataCell(Text(pedido['cobertura'])),
                              DataCell(
                                Text(
                                  pedido['status'],
                                  style: TextStyle(
                                    color: _getStatusColor(pedido['status']),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Função para definir as cores dos status
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pendente':
        return Colors.orange;
      case 'Finalizado':
        return Colors.green;
      case 'Em andamento':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}
