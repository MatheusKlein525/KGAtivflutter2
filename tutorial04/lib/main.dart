import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

enum PeriodoEstudo { manha, tarde, noite, madrugada }

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  PeriodoEstudo? _melhorPeriodo = PeriodoEstudo.manha;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text("Na sua opniao, qual o melhor horario de estudo?"),
              RadioGroup<PeriodoEstudo>(
                groupValue: _melhorPeriodo,
                onChanged: (PeriodoEstudo? value) {
                  setState(() {
                    _melhorPeriodo = value;
                    print("Periodo escolhido: ${_melhorPeriodo}");
                  });
                },
              
                child: Column(
                  children: [
                    RadioListTile<PeriodoEstudo>(
                      title: const Text('Manhã'),
                      value: PeriodoEstudo.manha,
                      subtitle: const Text('Ao acordar me sinto mais disposto.'),
                    ),
                    RadioListTile<PeriodoEstudo>(
                      title: const Text('Tarde'),
                      value: PeriodoEstudo.tarde,
                      subtitle: const Text('Após o almoço é a melhor escolha.'),
                    ), 
                    RadioListTile<PeriodoEstudo>(
                      title: const Text('Noite'),
                      value: PeriodoEstudo.noite,
                      subtitle: const Text('Na noite meu rendimento aumenta.'),
                    ), 
                    RadioListTile<PeriodoEstudo>(
                      title: const Text('Madrugada'),
                      value: PeriodoEstudo.madrugada,
                      subtitle: const Text(
                        'na calada da madrugada, quando todas as almas estão em silêncio vagando pelo espaço sideral, percebo que é a melhor hora para pensar.',
                      ), 
                    ), 
                  ],
                ), 
              ), 
              ElevatedButton(
                onPressed: () {
                  print("Valor selecionado: ${_melhorPeriodo}");
                  switch (_melhorPeriodo) {
                    case PeriodoEstudo.manha:
                      print("Ao acordar é melhor mesmo.");
                      break;
                    case PeriodoEstudo.tarde:
                      print("Depois do almoço é preferível.");
                      break;
                    case PeriodoEstudo.noite:
                      print("Só se for assistindo novela.");
                      break;
                    case PeriodoEstudo.madrugada:
                      print("Na calada da noite....");
                      break;
                    default:
                      print("ops... erro!");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                ),
                child: const Text('Go!'),
              ), 
            ],
          ), 
        ), 
      ), 
    ); 
  }
}

  

