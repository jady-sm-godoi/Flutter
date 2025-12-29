import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  
  final String respostaTexto;
  final VoidCallback onSelecionado;

  const Resposta({required this.respostaTexto, required this.onSelecionado, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
                onPressed: onSelecionado,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff3700b3),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  respostaTexto, 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 20
                    ),
                  ),
              ),
    );
  }
}