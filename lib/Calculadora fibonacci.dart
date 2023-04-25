

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FibonacciPage(),
    );
  }
}

class FibonacciPage extends StatefulWidget {
  @override
  _FibonacciPageState createState() => _FibonacciPageState();
}

class _FibonacciPageState extends State<FibonacciPage> {
  int _numero = 0;
  int _resultado = 0;

  void _calcularFibonacci() {
    setState(() {
      _resultado = _fibonacci(_numero);
    });
  }

  int _fibonacci(int numero) {
    if (numero <= 0) {
      return 0;
    } else if (numero == 1) {
      return 1;
    } else {
      return _fibonacci(numero - 1) + _fibonacci(numero - 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci Calculadora'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingrese un número:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _numero = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calcularFibonacci,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16.0),
            Text(
              'El resultado es: $_resultado',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
