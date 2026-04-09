import 'package:flutter/material.dart';
import 'botao.dart'; // Importando o seu componente

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String _display = '0';
  double _primeiroNumero = 0;
  String _operacao = '';
  bool _limparNoProximo = false;

  void _pressionarNumero(String numero) {
    setState(() {
      if (_display == '0' || _limparNoProximo) {
        _display = numero;
        _limparNoProximo = false;
      } else {
        _display += numero;
      }
    });
  }

  void _pressionarOperacao(String op) {
    setState(() {
      _primeiroNumero = double.parse(_display);
      _operacao = op;
      _limparNoProximo = true;
    });
  }

  void _calcular() {
    double segundoNumero = double.parse(_display);
    double resultado = 0;

    setState(() {
      if (_operacao == '+') resultado = _primeiroNumero + segundoNumero;
      if (_operacao == '-') resultado = _primeiroNumero - segundoNumero;
      if (_operacao == 'x') resultado = _primeiroNumero * segundoNumero;
      if (_operacao == '÷') {
        resultado = segundoNumero == 0 ? 0 : _primeiroNumero / segundoNumero;
      }

      _display = resultado.toString().endsWith('.0') 
          ? resultado.toInt().toString() 
          : resultado.toString();
      _operacao = '';
      _limparNoProximo = true;
    });
  }

  void _limpar() {
    setState(() {
      _display = '0';
      _primeiroNumero = 0;
      _operacao = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora'), elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(_display, style: const TextStyle(fontSize: 72)),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  BotaoCalculadora(texto: 'AC', cor: Colors.redAccent, aoPressionar: _limpar),
                  BotaoCalculadora(texto: '÷', cor: Colors.orange, aoPressionar: () => _pressionarOperacao('÷')),
                ],
              ),
              Row(
                children: [
                  BotaoCalculadora(texto: '7', aoPressionar: () => _pressionarNumero('7')),
                  BotaoCalculadora(texto: '8', aoPressionar: () => _pressionarNumero('8')),
                  BotaoCalculadora(texto: '9', aoPressionar: () => _pressionarNumero('9')),
                  BotaoCalculadora(texto: 'x', cor: Colors.orange, aoPressionar: () => _pressionarOperacao('x')),
                ],
              ),
              Row(
                children: [
                  BotaoCalculadora(texto: '4', aoPressionar: () => _pressionarNumero('4')),
                  BotaoCalculadora(texto: '5', aoPressionar: () => _pressionarNumero('5')),
                  BotaoCalculadora(texto: '6', aoPressionar: () => _pressionarNumero('6')),
                  BotaoCalculadora(texto: '-', cor: Colors.orange, aoPressionar: () => _pressionarOperacao('-')),
                ],
              ),
              Row(
                children: [
                  BotaoCalculadora(texto: '1', aoPressionar: () => _pressionarNumero('1')),
                  BotaoCalculadora(texto: '2', aoPressionar: () => _pressionarNumero('2')),
                  BotaoCalculadora(texto: '3', aoPressionar: () => _pressionarNumero('3')),
                  BotaoCalculadora(texto: '+', cor: Colors.orange, aoPressionar: () => _pressionarOperacao('+')),
                ],
              ),
              Row(
                children: [
                  BotaoCalculadora(texto: '0', aoPressionar: () => _pressionarNumero('0')),
                  BotaoCalculadora(texto: '=', cor: Colors.blueAccent, aoPressionar: _calcular),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}