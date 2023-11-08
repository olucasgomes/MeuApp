import 'package:flutter/material.dart';

class HIITCurtoScreen extends StatefulWidget {
  @override
  _HIITCurtoScreenState createState() => _HIITCurtoScreenState();
}

class _HIITCurtoScreenState extends State<HIITCurtoScreen> {
  int numeroSeries = 1;
  int duracaoEstimulo = 10;
  int intensidade = 50;
  int tempoRecuperacao = 30;
  String tipoRecuperacao = 'Ativo';

  void decrementTempoRecuperacao() {
    if (tempoRecuperacao > 10) {
      setState(() {
        tempoRecuperacao -= 10;
      });
    }
  }

  void incrementTempoRecuperacao() {
    if (tempoRecuperacao < 60) {
      setState(() {
        tempoRecuperacao += 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HIIT Curto'),
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

            // Rótulo "Duração"
            Text('Duração (segundos): $duracaoEstimulo segundos'), // Adicione esta linha
            Row(
              children: <Widget>[
                Text('10'),
                Expanded(
                  child: Slider(
                    value: duracaoEstimulo.toDouble(),
                    min: 10,
                    max: 60,
                    onChanged: (value) {
                      setState(() {
                        duracaoEstimulo = value.toInt();
                      });
                    },
                  ),
                ),
                Text('60'),
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

            // Adicione espaço antes dos botões
            SizedBox(height: 10),

            // Botões para ajustar o tempo de recuperação
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: decrementTempoRecuperacao,
                  child: Text('Menor'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: incrementTempoRecuperacao,
                  child: Text('Maior'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

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

            // Botão de salvar
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para salvar os dados inseridos
                },
                child: Text('Salvar'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50), // Aumente o tamanho do botão "Salvar"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

