import 'package:flutter/material.dart';

class TarefaFormPage extends StatefulWidget {
  const TarefaFormPage({super.key});

  @override
  State<TarefaFormPage> createState() => _TarefaFormPageState();
}
class _TarefaFormPageState extends State<TarefaFormPage> {

  late TextEditingController controllerDescricao;  //ALTERAMOS
  late TextEditingController controllerTitulo; //INCLUIMOS
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Cadastrar Tarefa"),),
    body: Column(
      children: [
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controllerTitulo,//INCLUIMOS
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite uma tarefa!",
              ),
            ),
          ),
          Padding( //INCLUIMOS
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controllerDescricao,//INCLUIMOS
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite uma descrição para a tarefa!",
              ),
            ),
          ),
      ],
    ),
    );
  }
}