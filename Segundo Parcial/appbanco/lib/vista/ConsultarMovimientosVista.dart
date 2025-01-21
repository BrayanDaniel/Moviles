import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl para formatear fechas
import '../controlador/MovimientoControlador.dart';
import '../modelo/MovimientoModelo.dart';

class ConsultarMovimientosVista extends StatefulWidget {
  @override
  _ConsultarMovimientosVistaState createState() =>
      _ConsultarMovimientosVistaState();
}

class _ConsultarMovimientosVistaState extends State<ConsultarMovimientosVista> {
  final MovimientoControlador _movimientoControlador = MovimientoControlador();
  List<MovimientoModelo> _movimientos = [];
  bool _cargando = false;

  @override
  void initState() {
    super.initState();
    _obtenerMovimientos();
  }

  // Obtener movimientos almacenados
  void _obtenerMovimientos() async {
    setState(() {
      _cargando = true;
    });

    try {
      final movimientos = await _movimientoControlador.obtenerMovimientos(); // Obtener movimientos desde SharedPreferences
      setState(() {
        _movimientos = movimientos;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al obtener movimientos: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _cargando = false;
      });
    }
  }

  // Método para formatear la fecha
  String _formatearFecha(String fecha) {
    final dateTime = DateTime.parse(fecha);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Consultar Movimientos',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF9B4D97), // Color morado
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _cargando
                ? Center(child: CircularProgressIndicator())
                : _movimientos.isEmpty
                ? Text(
              'No se encontraron movimientos',
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: _movimientos.length,
                itemBuilder: (context, index) {
                  final movimiento = _movimientos[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF9B4D97),
                            Color(0xFF7A3D82),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tipo: ${movimiento.tipo}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Cuenta: ${movimiento.cuenta}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Fecha: ${_formatearFecha(movimiento.fecha)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Importe: \$${movimiento.importe}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
