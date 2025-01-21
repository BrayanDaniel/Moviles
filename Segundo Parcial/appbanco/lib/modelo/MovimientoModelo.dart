import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MovimientoModelo {
  final String tipo;
  final String cuenta;
  final double importe;
  final String fecha;

  MovimientoModelo({
    required this.tipo,
    required this.cuenta,
    required this.importe,
    required this.fecha,
  });

  // Convertir a Map para almacenamiento
  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'cuenta': cuenta,
      'importe': importe,
      'fecha': fecha,
    };
  }

  // Convertir a JSON
  String toJson() {
    return json.encode(toMap());
  }

  // Crear desde Map
  static MovimientoModelo fromMap(Map<String, dynamic> map) {
    return MovimientoModelo(
      tipo: map['tipo'],
      cuenta: map['cuenta'],
      importe: map['importe'],
      fecha: map['fecha'],
    );
  }

  // Crear desde JSON
  static MovimientoModelo fromJson(String jsonStr) {
    final Map<String, dynamic> map = json.decode(jsonStr);
    return fromMap(map);
  }

  // Guardar movimiento en SharedPreferences
  static Future<void> guardarMovimiento(MovimientoModelo movimiento) async {
    final prefs = await SharedPreferences.getInstance();
    final movimientosList = prefs.getStringList('movimientos') ?? [];
    movimientosList.add(movimiento.toJson()); // Guardar como JSON
    await prefs.setStringList('movimientos', movimientosList);
  }

  // Obtener todos los movimientos almacenados
  static Future<List<MovimientoModelo>> obtenerMovimientos() async {
    final prefs = await SharedPreferences.getInstance();
    final movimientosList = prefs.getStringList('movimientos') ?? [];
    return movimientosList
        .map((item) => MovimientoModelo.fromJson(item)) // Convertir de JSON
        .toList();
  }
}
