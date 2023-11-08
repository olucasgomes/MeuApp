import 'package:flutter/material.dart';

class VisualizarTeste extends StatelessWidget {
  final String dataTeste;
  final double vo2Max;

  VisualizarTeste({required this.dataTeste, required this.vo2Max});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar Teste'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Retângulo com a data do teste e o valor do Vo2 Máximo
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300], // Cor do fundo retangular
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Data do Teste:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    dataTeste,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Vo2 Máximo:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    vo2Max.toStringAsFixed(2) + ' m/s',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
