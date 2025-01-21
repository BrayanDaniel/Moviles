import 'package:flutter/material.dart';
import '../controlador/MovimientoControlador.dart';
import '../modelo/MovimientoModelo.dart';

class TransferirVista extends StatefulWidget {
  @override
  _TransferirVistaState createState() => _TransferirVistaState();
}

class _TransferirVistaState extends State<TransferirVista> {
  final _formKey = GlobalKey<FormState>();
  final _controladorCuentaOrigen = TextEditingController();
  final _controladorCuentaDestino = TextEditingController();
  final _controladorImporte = TextEditingController();
  final MovimientoControlador _movimientoControlador = MovimientoControlador();
  bool _isLoading = false;

  @override
  void dispose() {
    _controladorCuentaOrigen.dispose();
    _controladorCuentaDestino.dispose();
    _controladorImporte.dispose();
    super.dispose();
  }

  void _realizarTransferencia() async {
    if (_formKey.currentState!.validate()) {
      final cuentaOrigen = _controladorCuentaOrigen.text.trim();
      final cuentaDestino = _controladorCuentaDestino.text.trim();
      final importe = double.tryParse(_controladorImporte.text.trim()) ?? 0.0;

      // Dato quemado
      const codEmp = '0001';

      setState(() {
        _isLoading = true;
      });

      try {
        final exito = await _movimientoControlador.transferir(cuentaOrigen, cuentaDestino, importe, codEmp);
        if (exito) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Transferencia realizada con éxito'),
              backgroundColor: Colors.green, // Color verde para éxito
            ),
          );
          _controladorCuentaOrigen.clear();
          _controladorCuentaDestino.clear();
          _controladorImporte.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al realizar la transferencia'),
              backgroundColor: Colors.red, // Color rojo para error
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red, // Color rojo para errores
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferir', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Color(0xFF9B4D97), // Color morado
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _controladorCuentaOrigen,
                decoration: InputDecoration(
                  labelText: 'Cuenta de origen',
                  labelStyle: TextStyle(color: Color(0xFF9B4D97)), // Morado
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Color(0xFF9B4D97)), // Morado
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, ingrese la cuenta de origen';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _controladorCuentaDestino,
                decoration: InputDecoration(
                  labelText: 'Cuenta de destino',
                  labelStyle: TextStyle(color: Color(0xFF9B4D97)), // Morado
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Color(0xFF9B4D97)), // Morado
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, ingrese la cuenta de destino';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _controladorImporte,
                decoration: InputDecoration(
                  labelText: 'Importe',
                  labelStyle: TextStyle(color: Color(0xFF9B4D97)), // Morado
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Color(0xFF9B4D97)), // Morado
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, ingrese el importe';
                  }
                  final importe = double.tryParse(value);
                  if (importe == null || importe <= 0) {
                    return 'Ingrese un importe válido mayor a 0';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _realizarTransferencia,
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('TRANSFERIR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9B4D97), // Morado
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
