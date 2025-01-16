import 'package:flutter/material.dart';
import '../vista/vista_inicio.dart'; // Asegúrate de importar tu VistaInicio aquí

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de Clima',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: VistaInicio(), // Cambiado a VistaInicio
    );
  }
}
