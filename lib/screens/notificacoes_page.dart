import 'package:flutter/material.dart';

class NotificacoesPage extends StatelessWidget {
  final List<Map<String, String>> _notificacoes = [
    {'titulo': 'Solicitação #1', 'mensagem': 'Status atualizado para Pendente.'},
    {'titulo': 'Solicitação #2', 'mensagem': 'Status atualizado para Finalizado.'},
    {'titulo': 'Solicitação #3', 'mensagem': 'Status atualizado para Em andamento.'},
    {'titulo': 'Solicitação #4', 'mensagem': 'Cobertura alterada para Hidrogel.'},
    {'titulo': 'Solicitação #5', 'mensagem': 'Status atualizado para Finalizado.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notificações"),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Notificações de Alteração de Solicitações",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _notificacoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.notifications, color: Colors.teal),
                      title: Text(
                        _notificacoes[index]['titulo']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_notificacoes[index]['mensagem']!),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Aqui você pode adicionar a navegação ou ação que desejar ao tocar na notificação
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Notificação selecionada!")),
                        );
                      },
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
