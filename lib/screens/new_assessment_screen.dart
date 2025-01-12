import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SolicitacaoAvaliacaoPage extends StatefulWidget {
  @override
  _SolicitacaoAvaliacaoPageState createState() => _SolicitacaoAvaliacaoPageState();
}

class _SolicitacaoAvaliacaoPageState extends State<SolicitacaoAvaliacaoPage> {
  final TextEditingController _nomePacienteController = TextEditingController();
  final TextEditingController _sugestaoCurativoController = TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();
  String? _tipoFerida;
  
  void _enviarSolicitacao() {
    // Implementar lógica para enviar solicitação
    final nomePaciente = _nomePacienteController.text;
    final sugestaoCurativo = _sugestaoCurativoController.text;
    final observacao = _observacaoController.text;
    

    if (nomePaciente.isEmpty || _tipoFerida == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, preencha os campos obrigatórios."),
        ),
      );
      return;
    }

    // Simular envio
    print("Solicitação Enviada:");
    print("Nome do Paciente: $nomePaciente");
    print("Tipo de Ferida: $_tipoFerida");
    print("Sugestão de Curativo: $sugestaoCurativo");
    print("Observação: $observacao");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Solicitação enviada com sucesso!"),
      ),
    );
  }

  String? _imageName;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path); // Atualiza o estado com a imagem selecionada
        _imageName = pickedFile.name; // Atualiza o nome da imagem
      });
    } else {
      print('Nenhuma imagem selecionada.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitação de Nova Avaliação"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nomePacienteController,
                decoration: InputDecoration(
                  labelText: "Nome do Paciente",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _tipoFerida,
                items: [
                  DropdownMenuItem(
                    value: "Queimadura",
                    child: Text("Queimadura"),
                  ),
                  DropdownMenuItem(
                    value: "Cirúrgica",
                    child: Text("Cirúrgica"),
                  ),
                  DropdownMenuItem(
                    value: "Crônica",
                    child: Text("Crônica"),
                  ),
                  DropdownMenuItem(
                    value: "Ferimento por pressão ",
                    child: Text("Ferimento por pressão"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _tipoFerida = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Tipo da Ferida",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _sugestaoCurativoController,
                decoration: InputDecoration(
                  labelText: "Sugestão de Curativo",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.cloud_upload,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8), // Espaçamento entre o container e o texto
              if (_imageName != null) // Mostra o nome apenas se a imagem foi selecionada
                Text(
                  'Imagem selecionada: $_imageName',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 16),
              TextField(
                controller: _observacaoController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Observação",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _enviarSolicitacao,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.teal,
                ),
                child: Text("Solicitar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
