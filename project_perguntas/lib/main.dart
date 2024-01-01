import 'dart:async';

import 'package:flutter/material.dart';
import './questionario.dart';
import 'package:project_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'azul', 'pontuacao': 10},
        {'texto': 'amarelo', 'pontuacao': 5},
        {'texto': 'verde', 'pontuacao': 3},
        {'texto': 'preto', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'coelho', 'pontuacao': 10},
        {'texto': 'cobra', 'pontuacao': 5},
        {'texto': 'burro', 'pontuacao': 3},
        {'texto': 'leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu jogo favorito?',
      'respostas': [
        {'texto': 'mario', 'pontuacao': 10},
        {'texto': 'zelda', 'pontuacao': 5},
        {'texto': 'megaman', 'pontuacao': 3},
        {'texto': 'fifa', 'pontuacao': 1},
      ],
    }
  ];

  bool get hasSelectedQuestion {
    return _selectedQuestion < _perguntas.length;
  }

  void _answer(int pontuacao) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += pontuacao;
      });
    }
  }

  void _resetForm(){
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: hasSelectedQuestion
            ? Questionario(
                perguntas: _perguntas,
                selectedQuestion: _selectedQuestion,
                onAnswer: _answer)
            : Resultado(_totalScore, _resetForm),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
