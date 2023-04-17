// main.dart

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => PantallaPrincipal(),
        '/mostrar_datos': (context) => PantallaMostrarDatos(),
      },
    );
  }
}

// pantalla_principal

class PantallaPrincipal extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla Principal')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: correoController,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: telefonoController,
              decoration: InputDecoration(labelText: 'Teléfono'),
            ),
            ElevatedButton(
              onPressed: () {
                String nombre = nombreController.text;
                String correo = correoController.text;
                String telefono = telefonoController.text;

                Navigator.pushNamed(
                  context,
                  '/mostrar_datos',
                  arguments: {
                    'nombre': nombre,
                    'correo': correo,
                    'telefono': telefono,
                  },
                );
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}



// pantalla_mostrar_datos

class PantallaMostrarDatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> datos = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String nombre = datos['nombre'] as String;
    final String correo = datos['correo'] as String;
    final String telefono = datos['telefono'] as String;

    return Scaffold(
      appBar: AppBar(title: Text('Datos del Formulario')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $nombre'),
            Text('Correo: $correo'),
            Text('Teléfono: $telefono'),
          ],
        ),
      ),
    );
  }
}

