import 'package:flutter/material.dart';

class VisualizarPedidosPage extends StatefulWidget {
  final List<Map<String, String>> pedidos;

  // Recebe os pedidos como parâmetro
  const VisualizarPedidosPage({Key? key, required this.pedidos}) : super(key: key);

  @override
  _VisualizarPedidosPageState createState() => _VisualizarPedidosPageState();
}

class _VisualizarPedidosPageState extends State<VisualizarPedidosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualização de Solicitações'),
        backgroundColor: Colors.teal,
      ),
      body: widget.pedidos.isEmpty
          ? const Center(
              child: Text(
                "Nenhuma solicitação encontrada.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20.0,
                  columns: const [
                    DataColumn(
                      label: Icon(Icons.check_box, color: Colors.orange),
                    ),
                    DataColumn(
                      label: Text('Nome'),
                    ),
                    DataColumn(
                      label: Text('Tipo da ferida'),
                    ),
                    DataColumn(
                      label: Text('Cobertura'),
                    ),
                    DataColumn(
                      label: Text('Status'),
                    ),
                  ],
                  rows: widget.pedidos.map((pedido) {
                    return DataRow(
                      cells: [
                        DataCell(Checkbox(
                          value: false,
                          onChanged: (value) {
                            // Implementar lógica do checkbox aqui
                          },
                        )),
                        DataCell(Text(pedido['nome'] ?? '')),
                        DataCell(Text(pedido['tipo'] ?? '')),
                        DataCell(Text(pedido['cobertura'] ?? '')),
                        DataCell(Text(pedido['status'] ?? '')),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Salvar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
        ],
        selectedItemColor: Colors.teal,
        onTap: (index) {
          // Implementar a navegação entre as páginas aqui
        },
      ),
    );
  }
}
