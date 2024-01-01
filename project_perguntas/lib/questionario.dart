import 'package:flutter/material.dart';
import 'package:project_perguntas/questao.dart';
import 'package:project_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int selectedQuestion;
  final void Function(int) onAnswer;

  const Questionario({
    required this.perguntas,
    required this.selectedQuestion,
    required this.onAnswer,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //'texto': 'coelho', 'nota': 10, pode ser 2 valores entao eh um Object
    List<Map<String, Object>> respostas = hasSelectedQuestion
        ? perguntas[selectedQuestion]['respostas'] as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[selectedQuestion]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => onAnswer(
              int.parse(
                resp['pontuacao'].toString(),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
