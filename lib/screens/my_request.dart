import 'package:flutter/material.dart';

class MinhasSolicitacoesPage extends StatefulWidget {
  @override
  _MinhasSolicitacoesPageState createState() => _MinhasSolicitacoesPageState();
}

class _MinhasSolicitacoesPageState extends State<MinhasSolicitacoesPage> {
  // Mock de solicitações
  final List<Map<String, String>> _solicitacoes = [
    {
      'nome': 'João Silva',
      'tipo': 'Queimadura',
      'status': 'Pendente',
    },
    {
      'nome': 'Maria Oliveira',
      'tipo': 'Úlcera Venosa',
      'status': 'Finalizado',
    },
    {
      'nome': 'Carlos Souza',
      'tipo': 'Ferida Cirúrgica',
      'status': 'Em andamento',
    },
    {
      'nome': 'Ana Costa',
      'tipo': 'Ferida por pressão',
      'status': 'Pendente',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Solicitações'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _solicitacoes.length,
          itemBuilder: (context, index) {
            final solicitacao = _solicitacoes[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.assignment,
                  color: _getStatusColor(solicitacao['status']!),
                ),
                title: Text(solicitacao['nome']!),
                subtitle: Text(
                  '${solicitacao['tipo']} - ${solicitacao['status']}',
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[600],
                  size: 18,
                ),
                onTap: () {
                  _onSolicitacaoTap(solicitacao);
                },
              ),
            );
          },
        ),
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

  // Ação ao clicar em uma solicitação
  void _onSolicitacaoTap(Map<String, String> solicitacao) {
    // Aqui você pode redirecionar para outra página ou mostrar um diálogo
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalhes da Solicitação'),
        content: Text(
          'Nome: ${solicitacao['nome']}\n'
          'Tipo: ${solicitacao['tipo']}\n'
          'Status: ${solicitacao['status']}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
