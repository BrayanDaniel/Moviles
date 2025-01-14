import 'package:flutter/material.dart';
import '../controlador/giroscopio_controlador.dart';
import '../modelo/giroscopio_modelo.dart';

class Interfaz extends StatefulWidget {
  @override
  _InterfazState createState() => _InterfazState();
}

class _InterfazState extends State<Interfaz> {
  late GiroscopioControlador _controlador;
  String _comando = 'Esperando...';

  @override
  void initState() {
    super.initState();
    _controlador = GiroscopioControlador(GiroscopioModelo());
    _controlador.actualizarComando = (comando) {
      setState(() {
        _comando = comando;
      });
    };
    _controlador.conectarServidor('ws://192.168.240.106:8765'); // Cambia a la IP de tu servidor
    _controlador.iniciarDeteccion();
  }

  @override
  void dispose() {
    _controlador.desconectar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control del Computador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Comando Actual:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _comando,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _controlador.desconectar();
              },
              child: Text('Desconectar'),
            ),
          ],
        ),
      ),
    );
  }
}
