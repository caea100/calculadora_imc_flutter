import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC_CALCULADORA',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: inicioPagina(),
    );
  }
}

class inicioPagina extends StatefulWidget {
  const inicioPagina({super.key});

  @override
  State<inicioPagina> createState() => _inicioPaginaState();
}

class _inicioPaginaState extends State<inicioPagina> {
  TextEditingController alturaController = TextEditingController();
  double peso = 70; // Valor padrão para o peso
  double imc = 0.0;
  
  void _calcular() {
    double altura = double.parse(alturaController.text) / 100;
    double resultadoIMC = peso / (altura * altura);
    setState(() {
      imc = resultadoIMC;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura em cm'),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Selecione seu peso'),
                    trailing: Text('${peso.toStringAsFixed(1)} kg'),
                  ),
                  Slider(
                    value: peso,
                    onChanged: (novoPeso) {
                      setState(() {
                        peso = novoPeso;
                      });
                    },
                    min: 40,
                    max: 200,
                    divisions: 160,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _calcular,
              child: Text('Calcular IMC'),
            ),
            Text(
              'Seu IMC é: ${imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
