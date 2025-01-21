import 'package:flutter/material.dart';

class SalvarPage extends StatefulWidget {
  @override
  _SalvarPageState createState() => _SalvarPageState();
}

class _SalvarPageState extends State<SalvarPage> {
  // Lista de solicitações mock (exemplo simples de dados)
  final List<Map<String, String>> _solicitacoes = [
    {'nome': 'João Silva', 'tipo': 'Queimadura', 'status': 'Pendente'},
    {'nome': 'Maria Oliveira', 'tipo': 'Úlcera Venosa', 'status': 'Finalizado'},
    {'nome': 'Carlos Souza', 'tipo': 'Ferida Cirúrgica', 'status': 'Em andamento'},
  ];

  // Lista de solicitações salvas
  List<Map<String, String>> _salvos = [];

  // Função para adicionar uma solicitação à lista de salvos
  void _salvarSolicitacao(Map<String, String> solicitacao) {
    setState(() {
      _salvos.add(solicitacao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitações Salvas"),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Solicitações Disponíveis para Salvar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Lista de solicitações disponíveis
            Expanded(
              child: ListView.builder(
                itemCount: _solicitacoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(_solicitacoes[index]['nome']!),
                      subtitle: Text("${_solicitacoes[index]['tipo']} - ${_solicitacoes[index]['status']}"),
                      trailing: IconButton(
                        icon: Icon(Icons.save_alt),
                        onPressed: () {
                          _salvarSolicitacao(_solicitacoes[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Solicitação salva com sucesso!")),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Solicitações Salvas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Lista de solicitações salvas
            Expanded(
              child: _salvos.isEmpty
                  ? Center(child: Text("Nenhuma solicitação salva."))
                  : ListView.builder(
                      itemCount: _salvos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(_salvos[index]['nome']!),
                            subtitle: Text("${_salvos[index]['tipo']} - ${_salvos[index]['status']}"),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
