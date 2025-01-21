import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'vista/LoginVista.dart'; // Agregamos LoginVista en lugar de DepositarVista
import 'controlador/MovimientoControlador.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovimientoControlador()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Banco',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginVista(), // Cambiado a LoginVista
    );
  }
}
