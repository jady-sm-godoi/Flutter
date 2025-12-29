import 'package:flutter/material.dart';

class Questao extends StatelessWidget {

  final String pergunta;

  const Questao({required this.pergunta, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        pergunta,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}