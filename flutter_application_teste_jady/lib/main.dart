
import 'package:flutter/material.dart';

void main(){
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp>{
  var perguntaSelecionada = 0;

  void responder(){
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context){

    final List<String> perguntas = [
      'Como o Flutter renderiza a interface do usuário e qual é o papel do método build?',
      'Qual a diferença prática entre StatelessWidget e StatefulWidget em uma aplicação Flutter?',
      'Como funciona o gerenciamento de estado em uma aplicação Flutter?',
      'Explique o ciclo de vida de um StatefulWidget e seu impacto na aplicação.',
      'Como uma aplicação Flutter lida com layouts responsivos para diferentes tamanhos de tela?',
      'Como funciona a navegação entre telas em Flutter?',
      'Como o Dart trata operações assíncronas em uma aplicação Flutter?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          elevation: 10,
          backgroundColor: Color( 0xff6200ee),
          shadowColor: Color(0xff3700b3),
        ),
        body: Center(
          child: Column(
            children: [
              Text(perguntas[perguntaSelecionada]),
              ElevatedButton(
                onPressed: responder,
                child: Text('Resposta 1'),
              ),
              ElevatedButton(
                onPressed: responder,
                child: Text('Resposta 2'),
              ),
              ElevatedButton(
                onPressed: responder,
                child: Text('Resposta 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState(){
    return PerguntaAppState();
  }
}