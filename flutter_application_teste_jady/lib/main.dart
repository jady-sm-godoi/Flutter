import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main(){
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{

  var _perguntaSelecionada = 0;

  bool _correta = true;

  final List<Map<String, Object>> _perguntas = const [
      {
        'pergunta': 'Como o Flutter renderiza a interface do usuário e qual é o papel do método build?',
        'respostas': [
          {'texto': 'O método build descreve a interface do usuário a partir de widgets.', 'correta': true},
          {'texto': 'O método build é responsável por executar chamadas HTTP.', 'correta': false},
          {'texto': 'O Flutter utiliza HTML e CSS para renderizar a interface.', 'correta': false},
        ],
      },
      {
        'pergunta': 'Qual a diferença prática entre StatelessWidget e StatefulWidget em uma aplicação Flutter?',
        'respostas': [
          {'texto': 'StatefulWidget pode manter e atualizar estado, enquanto StatelessWidget não.', 'correta': true},
          {'texto': 'StatelessWidget é mais lento que StatefulWidget.', 'correta': false},
          {'texto': 'StatefulWidget não pode receber parâmetros no construtor.', 'correta': false},
        ],
      },
      {
        'pergunta': 'Como funciona o gerenciamento de estado em uma aplicação Flutter?',
        'respostas': [
          {'texto': 'O estado pode ser gerenciado com setState ou soluções como Provider e Bloc.', 'correta': true},
          {'texto': 'O Flutter gerencia automaticamente todo o estado da aplicação.', 'correta': false},
          {'texto': 'O estado só pode ser alterado no método main.', 'correta': false},
        ],
      },
      {
        'pergunta': 'Explique o ciclo de vida de um StatefulWidget e seu impacto na aplicação.',
        'respostas': [
          {'texto': 'Inclui métodos como initState, build e dispose, que controlam criação e remoção.', 'correta': true},
          {'texto': 'O ciclo de vida é composto apenas pelo método build.', 'correta': false},
          {'texto': 'StatefulWidget não possui ciclo de vida.', 'correta': false},
        ],
      },
      {
        'pergunta': 'Como uma aplicação Flutter lida com layouts responsivos para diferentes tamanhos de tela?',
        'respostas': [
          {'texto': 'Utilizando widgets como MediaQuery, LayoutBuilder e Flex.', 'correta': true},
          {'texto': 'Criando uma aplicação diferente para cada tamanho de tela.', 'correta': false},
          {'texto': 'Usando apenas valores fixos de largura e altura.', 'correta': false},
        ],
      },
      {
        'pergunta': 'Como funciona a navegação entre telas em Flutter?',
        'respostas': [
          {'texto': 'Por meio do Navigator, usando push e pop ou rotas nomeadas.', 'correta': true},
          {'texto': 'A navegação é feita automaticamente pelo Flutter.', 'correta': false},
          {'texto': 'Cada tela deve ser criada em um projeto separado.', 'correta': false},
        ],
      },
      {
        'pergunta': 'Como o Dart trata operações assíncronas em uma aplicação Flutter?',
        'respostas': [
          {'texto': 'Utilizando Future, async/await e Stream.', 'correta': true},
          {'texto': 'Executando tudo de forma síncrona para melhor performance.', 'correta': false},
          {'texto': 'Apenas por meio de threads manuais.', 'correta': false},
        ],
      },
    ];

  void _responder(bool correta){
    if (temPerguntaSelecionada){
      setState(() {
        if(correta){
          print('Resposta correta!');
          _perguntaSelecionada++;
          _correta = true;
        } else {
          print('Resposta incorreta!');
          _correta = false;
        }
      });
    }
  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  } 

  @override
  Widget build(BuildContext context){

    List<Map<String, Object>> respostas = temPerguntaSelecionada 
      ? _perguntas[_perguntaSelecionada]['respostas'] as List<Map<String, Object>> 
      : [];

    List<Widget> widgetsRespostas = respostas
      .map((resp) => Resposta(
          respostaTexto: (resp)['texto'] as String,
          onSelecionado: () => _responder(resp['correta'] as bool),
        ))
      .toList();


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
          child: temPerguntaSelecionada ? Column(
            children: [
              Questao(pergunta: _perguntas[_perguntaSelecionada]['pergunta'] as String,),
              ...widgetsRespostas,
              !_correta ? Text( 'Alternativa errada!', style: TextStyle(fontSize: 24, color: Colors.red,), ) : SizedBox.shrink(),
            ],
          ) : null,
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }
}