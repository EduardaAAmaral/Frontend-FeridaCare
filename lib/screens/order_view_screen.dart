import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
    },
    {
      'nome': 'Maria Oliveira',
      'tipo': 'Crônica',
      'cobertura': 'Espuma Hidrofílica',
      'status': 'Pendente',
    },
    {
      'nome': 'Carlos Souza',
      'tipo': 'Cirúrgica',
      'cobertura': 'Curativo Alginato',
      'status': 'Finalizado',
    },
    {
      'nome': 'Ana Costa',
      'tipo': 'Ferimento por pressão',
      'cobertura': 'Filme Transparente',
      'status': 'Pendente',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualizar Pedidos"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        "Nome",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Tipo da Ferida",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Cobertura",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Status",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: _pedidosMock
                      .map(
                        (pedido) => DataRow(
                          cells: [
                            DataCell(Text(pedido['nome'])),
                            DataCell(Text(pedido['tipo'])),
                            DataCell(Text(pedido['cobertura'])),
                            DataCell(Text(pedido['status'])),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
