import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int respostasCorretas;
  final int respostasErradas;
  final VoidCallback? reiniciar;

  const Resultado({required this.respostasCorretas, required this.respostasErradas, required this.reiniciar, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Você acertou $respostasCorretas vezes e errou $respostasErradas vezes!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: reiniciar,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff6200ee),
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            'Reiniciar Questionário', 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 20
              ),
            ),
        ),
      ],
    );
  }
}