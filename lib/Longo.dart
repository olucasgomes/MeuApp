import 'package:flutter/material.dart';


class HIITLongoScreen extends StatefulWidget {
  @override
  _HIITLongoScreenState createState() => _HIITLongoScreenState();
}

class _HIITLongoScreenState extends State<HIITLongoScreen> {
  int numeroSeries = 1;
  int duracaoEstimulo = 60;
  int intensidade = 50;
  int tempoRecuperacao = 60;
  String tipoRecuperacao = 'Ativo';

  final int duracaoEstimuloMin = 60;
  final int duracaoEstimuloMax = 300;
  final int tempoRecuperacaoMin = 60;
  final int tempoRecuperacaoMax = 240;

  void decrementTempoRecuperacao() {
    if (tempoRecuperacao > tempoRecuperacaoMin) {
      setState(() {
        tempoRecuperacao -= 60;
      });
    }
  }

  void incrementTempoRecuperacao() {
    if (tempoRecuperacao < tempoRecuperacaoMax) {
      setState(() {
        tempoRecuperacao += 60;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HIIT Longo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Campo para inserir o número de séries
            Text('Séries de Estímulo:'),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número de Séries'),
              onChanged: (text) {
                setState(() {
                  numeroSeries = int.tryParse(text) ?? 1;
                });
              },
            ),

            SizedBox(height: 20),

            // Rótulo "Série de Estímulo"
            Text('Série de Estímulo:'),

            // Slider para ajustar a duração do estímulo
            Row(
              children: <Widget>[
                Text('$duracaoEstimulo min'),
                Expanded(
                  child: Slider(
                    value: duracaoEstimulo.toDouble(),
                    min: duracaoEstimuloMin.toDouble(),
                    max: duracaoEstimuloMax.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        duracaoEstimulo = value.toInt();
                      });
                    },
                  ),
                ),
                Text('$duracaoEstimuloMax min'),
              ],
            ),

            SizedBox(height: 20),

            // Rótulo "Intensidade"
            Text('Intensidade (%):'),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Porcentagem'),
                    onChanged: (text) {
                      setState(() {
                        intensidade = int.tryParse(text) ?? 50;
                      });
                    },
                  ),
                ),
                Text('%'),
              ],
            ),

            SizedBox(height: 20),

            // Rótulo "Tempo de Recuperação"
            Text('Tempo de Recuperação:'),

            // Slider para ajustar o tempo de recuperação
            Row(
              children: <Widget>[
                Text('$tempoRecuperacao min'),
                Expanded(
                  child: Slider(
                    value: tempoRecuperacao.toDouble(),
                    min: tempoRecuperacaoMin.toDouble(),
                    max: tempoRecuperacaoMax.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        tempoRecuperacao = value.toInt();
                      });
                    },
                  ),
                ),
                Text('$tempoRecuperacaoMax min'),
              ],
            ),

            // Rótulo "Tipo de Recuperação"
            Text('Tipo de Recuperação:'),

            // Botões para selecionar o tipo de recuperação
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tipoRecuperacao = 'Ativo';
                    });
                  },
                  child: Text('Ativo'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tipoRecuperacao = 'Passivo';
                    });
                  },
                  child: Text('Passivo'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Campo para inserir o Percentual de Intensidade
            Text('Percentual de Intensidade:'),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Porcentagem'),
                    onChanged: (text) {
                      setState(() {
                        intensidade = int.tryParse(text) ?? 50;
                      });
                    },
                  ),
                ),
                Text('%'),
              ],
            ),

            SizedBox(height: 20),

            // Botão de salvar
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para salvar os dados inseridos
                },
                child: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
