import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:primeira_application_flutter/models/tarefa_model.dart';
import 'package:primeira_application_flutter/widgets/subtitulo_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.subtitulo});
  final String title;
  final String subtitulo;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tarefa> tarefas = []; //ALTERAMOS AQUI

  late TextEditingController controllerDescricao;  //ALTERAMOS
  late TextEditingController controllerTitulo; //INCLUIMOS

 bool isLoading = true;

  @override
  void initState(){
    controllerDescricao = TextEditingController(); //INCLUIMOS
    controllerTitulo = TextEditingController(); //INCLUIMOS
    _getTarefas();
    super.initState();
  }

  Future<void> _getTarefas() async{
    setState(() {
      isLoading = true;
    });
    var dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 30),
        baseUrl: 'https://6912665d52a60f10c8218a94.mockapi.io/api/v1',
        ),
    );
    var response = await dio.get('/tarefa');
    response.data;
    var listaData = response.data as List;
    for(var data in listaData){
      var tarefa = Tarefa(descricao: data ['descricao'],
          titulo: data['titulo'],
          );
          tarefas.add(tarefa);
    }
    setState(() {
      isLoading = false;
    });

  }

    @override
  void dispose(){
    controllerDescricao.dispose();
    controllerTitulo.dispose();
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
            SubtituloWidget(label: widget.subtitulo),
          ],
        ),
      ),
      body: 
      isLoading ? Center(child: CircularProgressIndicator(),) :
      Column(
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
          
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.task),
                  title: Text(tarefas[index].descricao),
                  subtitle: Text(tarefas[index].descricao),
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
  void _addicionarTarefa(){
    var tituloTarefa = controllerTitulo.text; //INCLUIMOS
    var descricaoTarefa = controllerTitulo.text;//INCLUIMOS

    if(tituloTarefa.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar (content: Text("Você precisa difgitar uma tarefa")),
      );
      return;
    }
        if(descricaoTarefa.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar (content: Text("Você precisa difgitar uma tarefa")),
      );
      return;
    }
    var tarefa = Tarefa(descricao: descricaoTarefa, titulo: tituloTarefa); 

    setState(() {
          
    tarefas.add(tarefa); //ALTERAMOS
   }); 
   controllerDescricao.clear();
   controllerTitulo.clear();
  }
}
