import 'package:flutter/material.dart';
import 'model/filme_model.dart'; 
import 'database.dart';          

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  
  final List<Filme> filmes = Database.getFilmes();

  Color getCorEstrela(double imdb) {
    if (imdb > 8.5) {
      return Colors.amber; 
    } else {
      return Colors.grey;  
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CineFlutter"),
          backgroundColor: Colors.blueAccent,
        ),

        body: ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes [index];
            return ListTile(  
              leading: Icon(
                Icons.movie,
                color: Colors.blue,
              ),
              title: Text(filme.titulo),
              subtitle: Text(('Ano: ${filme.anoLancamento}')),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star, 
                    color: getCorEstrela(filme.imdb), 
                    size: 18,
                  ),
                  Text(filme.imdb.toString()),
                ],
              ),
              onTap: () {
                print('Clicou em: ${filme.titulo}');
              },
              
              onLongPress: () {
                print('Você clicou LongPress no filme ${filme.titulo}');
              },
            );
          }
        )
      ),
    );
  }
}





  

