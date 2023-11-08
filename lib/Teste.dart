import 'package:flutter/material.dart';

import 'Home.dart';

class TestT5Screen extends StatefulWidget {

  @override
  _TestT5ScreenState createState() => _TestT5ScreenState();
}

class _TestT5ScreenState extends State<TestT5Screen> {
  double vVo2Max = 0.0;
  TextEditingController distanceController = TextEditingController();

  List<String> tips = [
    "Dica 1: Mantenha um ritmo constante.",
    "Dica 2: Use um cronômetro para controlar o tempo.",
    "Dica 3: Respire regularmente.",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste T5'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Carrossel com as dicas dentro de um fundo retangular
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300], // Cor do fundo retangular
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                height: 100,
                child: PageView.builder(
                  itemCount: tips.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        tips[index],
                        style: TextStyle(fontSize: 16.0),
                      ),
                    );
                  },
                ),
              ),
            ),



            SizedBox(height: 20), // Espaço entre o carrossel e o próximo widget


            // Campo para preencher a distância percorrida
            TextField(
              controller: distanceController,
              decoration: InputDecoration(labelText: 'Distância percorrida (em metros)'),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  if (text.isNotEmpty) {
                    double distance = double.parse(text);
                    vVo2Max = (distance / 300).toDouble(); // Cálculo corrigido do vVo2
                  } else {
                    vVo2Max = 0.0;
                  }
                });
              },
            ),

            SizedBox(height: 20), // Espaço entre o campo de texto e o texto do resultado

            // Mostrar o resultado do cálculo em m/s
            Text(
              'Seu vVo2 máximo foi de: ${(vVo2Max).toStringAsFixed(2)} m/s',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20), // Espaço entre o texto do resultado e o botão de salvar

            // Botão para salvar a informação
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomeScreen(vVo2Max: vVo2Max)),
                  );
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
