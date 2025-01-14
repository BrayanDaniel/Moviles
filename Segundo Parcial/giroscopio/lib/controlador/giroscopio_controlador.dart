import 'package:flutter/material.dart';
import '../modelo/giroscopio_modelo.dart';

class GiroscopioControlador {
  final GiroscopioModelo modelo;
  Function(String)? actualizarComando;

  GiroscopioControlador(this.modelo);

  // Inicializa la detección del giroscopio y maneja las acciones
  void iniciarDeteccion() {
    modelo.detectarGiroscopio((x, y, z) {
      if (x > 1.5) {
        modelo.enviarComando('Abrir página web');
        actualizarComando?.call('Página web abierta');
      } else if (y > 1.5) {
        modelo.enviarComando('Abrir aplicación ofimática');
        actualizarComando?.call('Aplicación ofimática abierta');
      } else if (z > 1.5) {
        modelo.enviarComando('Reproducir contenido multimedia');
        actualizarComando?.call('Contenido multimedia reproduciéndose');
      }
    });
  }

  // Establecer conexión al servidor
  void conectarServidor(String url) {
    modelo.conectarServidor(url);
  }

  // Desconectar del servidor
  void desconectar() {
    modelo.desconectar();
  }
}
