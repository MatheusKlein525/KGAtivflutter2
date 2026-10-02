import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     home:Scaffold (
      appBar: AppBar(
        title:Text("Aqui e AppBar"),
        backgroundColor: Colors.amber,
      ),
      body: Center(child: Text("Aqui é o body do Scaffold"),),
      backgroundColor: Colors.grey,

      drawer: Drawer(
        child: ListView(children: [Text('Opção 1'), Text('Opção 2')],),
      ),
     )
    );
  }
}
