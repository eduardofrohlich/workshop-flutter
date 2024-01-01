import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int totalScore;
  final void Function() onResetForm;

  Resultado(this.totalScore, this.onResetForm);

  String get textResult {
    if (totalScore < 8) {
      return 'Parabéns';
    } else if (totalScore < 12) {
      return 'Impressive, kid';
    } else if (totalScore < 16) {
      return 'Woww look at him!';
    } else {
      return 'Sabe muito';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            textResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: onResetForm,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
