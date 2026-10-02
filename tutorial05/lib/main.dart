import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String? opcaoPagamento = 'Pix';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quizz"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownMenu<String>(
                  initialSelection: 'Pix',
                  label: const Text('Forma de Pagamento'),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 'Pix', label: 'Pix'),
                    DropdownMenuEntry(value: 'Boleto', label: 'Boleto Bancário'),
                    DropdownMenuEntry(value: 'Cartao', label: 'Cartão de Crédito'),
                  ],
                  onSelected: (String? novoValor) {
                    setState(() {
                      opcaoPagamento = novoValor;
                    });
                    print('Selecionado: $novoValor');
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print("Valor selecionado: $opcaoPagamento");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 100,
                    ),
                  ),
                  child: const Text('Gol'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
