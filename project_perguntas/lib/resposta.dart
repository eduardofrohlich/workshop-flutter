import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  Resposta(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white, // text color
          backgroundColor: Colors.blue,
        ),
        onPressed: onSelected,
        child: Text(texto),
      ),
    );
  }
}