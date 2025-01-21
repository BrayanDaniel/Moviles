import 'package:flutter/cupertino.dart';
import '../modelo/MovimientoModelo.dart';

class MovimientoControlador extends ChangeNotifier {
  // Lista de movimientos en memoria
  List<MovimientoModelo> _movimientos = [];

  // Acceder a la lista de movimientos
  List<MovimientoModelo> get movimientos => _movimientos;

  // Realizar depósito
  Future<bool> depositar(String cuenta, double importe, String codEmp) async {
    final movimiento = MovimientoModelo(
      tipo: 'Depósito',
      cuenta: cuenta,
      importe: importe,
      fecha: DateTime.now().toString(),
    );
    await MovimientoModelo.guardarMovimiento(movimiento);
    _movimientos.add(movimiento); // Añadir el movimiento a la lista directamente
    notifyListeners(); // Notificamos que los movimientos han cambiado
    return true; // éxito en el depósito
  }

  // Realizar retiro
  Future<bool> retirar(String cuenta, double importe, String codEmp) async {
    final movimiento = MovimientoModelo(
      tipo: 'Retiro',
      cuenta: cuenta,
      importe: importe,
      fecha: DateTime.now().toString(),
    );
    await MovimientoModelo.guardarMovimiento(movimiento);
    _movimientos.add(movimiento); // Añadir el movimiento a la lista directamente
    notifyListeners(); // Notificamos que los movimientos han cambiado
    return true; // éxito en el retiro
  }

  // Realizar transferencia
  Future<bool> transferir(String cuentaOrigen, String cuentaDestino, double importe, String codEmp) async {
    final movimiento = MovimientoModelo(
      tipo: 'Transferencia',
      cuenta: '$cuentaOrigen a $cuentaDestino',
      importe: importe,
      fecha: DateTime.now().toString(),
    );
    await MovimientoModelo.guardarMovimiento(movimiento);
    _movimientos.add(movimiento); // Añadir el movimiento a la lista directamente
    notifyListeners(); // Notificamos que los movimientos han cambiado
    return true; // éxito en la transferencia
  }

  // Obtener movimientos desde SharedPreferences
  Future<List<MovimientoModelo>> obtenerMovimientos() async {
    _movimientos = await MovimientoModelo.obtenerMovimientos();
    notifyListeners(); // Notificamos que los movimientos han cambiado
    return _movimientos; // Retornar la lista de movimientos
  }
}
