import 'dart:math';
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
  final TextEditingController _n1Controller = TextEditingController();
  final TextEditingController _n2Controller = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  void _calcular(String operacao) {
    final double num1 = double.tryParse(_n1Controller.text) ?? 0.0;
    final double num2 = double.tryParse(_n2Controller.text) ?? 0.0;

    switch (operacao) {
      case 'soma':
        _resultController.text = (num1 + num2).toString();
        break;
      case 'subtracao':
        _resultController.text = (num1 - num2).toString();
        break;
      case 'multiplicacao':
        _resultController.text = (num1 * num2).toString();
        break;
      case 'divisao':
        if (num2 == 0) {
          _resultController.text = 'Erro: Divisão por zero';
        } else {
          _resultController.text = (num1 / num2).toString();
        }
        break;
      case 'exponenciacao':
        _resultController.text = pow(num1, num2).toString();
        break;
    }

    setState(() {});
  }

  void _limpar() {
    setState(() {
      _n1Controller.clear();
      _n2Controller.clear();
      _resultController.clear();
    });
  }

  @override
  void dispose() {
    _n1Controller.dispose();
    _n2Controller.dispose();
    _resultController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mini Calculadora'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _n1Controller,
                decoration: const InputDecoration(
                  labelText: 'Informe valor A (ou Base)',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: _n2Controller,
                decoration: const InputDecoration(
                  labelText: 'Informe valor B (ou Expoente)',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              ),

              const SizedBox(height: 20),

              // Primeira linha de operações (Soma e Subtração)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _calcular('soma'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text('Soma (+)'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _calcular('subtracao'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text('Subtração (-)'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Segunda linha de operações (Multiplicação e Divisão)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _calcular('multiplicacao'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text('Multiplicação (x)'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _calcular('divisao'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text('Divisão (/)'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Terceira linha de operações (Exponenciação e Limpar)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _calcular('exponenciacao'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text('Exponenciação (A^B)'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _limpar,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        foregroundColor: Colors.red,
                      ),
                      child: const Text('Limpar'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _resultController,
                decoration: const InputDecoration(
                  labelText: 'Resultado',
                  prefixIcon: Icon(Icons.equalizer),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}