import 'package:flutter/material.dart';
import 'package:flutter_application_teste_jady/questao.dart';
import 'package:flutter_application_teste_jady/resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final Function(bool) responder;
  final List<Map<String, Object>> respostas;
  final bool correta;

  const Questionario({ 
    required this.perguntas, 
    required this.perguntaSelecionada, 
    required this.responder, 
    required this.respostas,
    required this.correta,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsRespostas = respostas
      .map((resp) => Resposta(
          respostaTexto: (resp)['texto'] as String,
          onSelecionado: () => responder(resp['correta'] as bool),
        ))
      .toList();
    
    return Column(
            children: [
              Questao(pergunta: perguntas[perguntaSelecionada]['pergunta'] as String,),
              ...widgetsRespostas,
              !correta ? Text( 'Alternativa errada!', style: TextStyle(fontSize: 24, color: Colors.red,), ) : SizedBox.shrink(),
            ],
          );
  }
}