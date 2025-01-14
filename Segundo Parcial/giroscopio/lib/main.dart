import 'package:flutter/material.dart';
import 'vista/interfaz.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controlador del Computador',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Interfaz(),
    );
  }
}
