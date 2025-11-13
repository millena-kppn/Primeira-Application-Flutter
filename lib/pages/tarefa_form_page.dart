import 'package:flutter/material.dart';

class TarefaFormPage extends StatefulWidget {
  const TarefaFormPage({super.key});

  @override
  State<TarefaFormPage> createState() => _TarefaFormPageState();
}

class _TarefaFormPageState extends State<TarefaFormPage> {
  late TextEditingController controllerDescricao; //ALTERAMOS
  late TextEditingController controllerTitulo; //INCLUIMOS
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    controllerDescricao = TextEditingController(); //INCLUIMOS
    controllerTitulo = TextEditingController(); //INCLUIMOS
    super.initState();
  }

  @override
  void dispose() {
    controllerDescricao.dispose();
    controllerTitulo.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Tarefa")),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controllerTitulo, //INCLUIMOS
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite uma tarefa!",
                ),
                validator: (value) => _validaCamposDescricao(),
              ),
            ),
            Padding(
              //INCLUIMOS
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controllerDescricao, //INCLUIMOS
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite uma descrição para a tarefa!",
                ),
                validator: (value) => _validaCamposDescricao(),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _salvarTarefa,
              label: Text("Salvar Tarefa"),
              icon: Icon(Icons.save_alt_outlined),
            ),
          ],
        ),
      ),
    );
  }

  String? _validaCamposDescricao() {
    var titulo = controllerTitulo.text; //INCLUIMOS

    if (titulo.trim().isEmpty) {
      return "Você precisa digitar uma descrição";
    }
  }

  Future<void> _salvarTarefa() async {
    var tituloTarefa = controllerTitulo.text; //INCLUIMOS
    var descricaoTarefa = controllerDescricao.text;

    if(formkey.currentState?.validate() == true){
    }
  }
}
