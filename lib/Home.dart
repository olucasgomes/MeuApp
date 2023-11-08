import 'package:flutter/material.dart';

import 'Curto.dart';
import 'Longo.dart';
import 'Teste.dart';


class HomeScreen extends StatelessWidget {
  double? vVo2Max = 0.0;
  HomeScreen({this.vVo2Max});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de HIIT')
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Text('${vVo2Max}'),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Seja bem-vindo!', // Mensagem de boas-vindas
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Parte 1: Teste
            Section('Teste', [
              SquareButton('Teste T5', () {
                Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) => TestT5Screen()),
                );
              }),
            ]),
            // Parte 2: Treino
            Section('Treino', [
              Row(
                children: [
                  SquareButton('HIIT Curto', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HIITCurtoScreen()),
                    );
                  }),
                  SquareButton('HIIT Longo', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  HIITLongoScreen()),
                    );
                  }),
                ],
              ),
            ]),
            // Parte 3: Dicas
            Section('Dicas', [
              SquareButton('Dicas', () {
                // Adicione o código para a opção "Dicas" aqui.
              }),
            ]),
          ],
        ),
      ),
    );
  }
}



class Section extends StatelessWidget {
  final String title;
  final List<Widget> children;



  Section(this.title, this.children);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Espaço entre o título e os botões
          ...children,
          SizedBox(height: 20), // Espaço entre as seções
        ],
      ),
    );
  }
}



class SquareButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  SquareButton(this.title, this.onPressed);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.only(right: 10), // Espaço à direita dos botões
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // Cor de fundo
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Borda sem arredondamento
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(
              width: 150,
              height: 50,
              color: Colors.purple, // Cor do cabeçalho
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
