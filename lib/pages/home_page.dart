import 'package:flutter/material.dart';
import 'package:primeira_application_flutter/widgets/subtitulo_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tarefas = ['Tarefa 1', 'Tarefa 2', 'Tarefa 3'];
  var controller = TextEditingController();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Text(widget.title),
            SizedBox(width: 8),
            SubtituloWidget(label: widget.subtitle),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller, //add controlador
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite uma tarefa!",
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.task),
                  title: Text("${tarefas[index]}"),
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addicionarTarefa,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addicionarTarefa() {
    var tarefaDigitada = controller.text;
    if (tarefaDigitada.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Você precisa digitar uma tarefa")),
      );
      return;
    }
    setState(() {
      tarefas.add(tarefaDigitada);
    });
  }
}
